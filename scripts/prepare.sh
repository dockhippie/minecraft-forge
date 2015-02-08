#!/usr/bin/env bash

exec 2>&1
set -e

function pruned_find() {
  find / -type d \( -name dev -o -name proc \) -prune -o $@ -print
}

rm -f /etc/zypp/repos.d/*

cat >| /etc/zypp/repos.d/dist-oss.repo <<EOF
[dist-oss]
name=openSUSE OSS
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/13.2/repo/oss/
type=yast2
EOF

cat >| /etc/zypp/repos.d/dist-oss-update.repo <<EOF
[dist-oss-update]
name=openSUSE OSS Update
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/13.2/
type=rpm-md
EOF

zypper --gpg-auto-import-keys -n ref
#zypper --gpg-auto-import-keys -n dup

zypper -n install -l --force-resolution \
  ca-certificates-mozilla \
  ca-certificates \
  wget \
  java-1_8_0-openjdk-headless \
  vim

zypper clean --all

rm -rf /root/*
rm -rf /tmp/*

rm -rf /etc/zypp/locks
rm -rf /var/cache/man

pruned_find -perm /u+s | xargs -r chmod u-s
pruned_find -perm /g+s | xargs -r chmod g-s

echo -e "\nRemaining suspicious security bits/flaws:"
(
  pruned_find ! -user root
  pruned_find -perm /u+s
  pruned_find -perm /g+s
  pruned_find -perm /+t
) | sed -u "s/^/  /"

echo -e "\nInstalled versions of important packages:"
(
  java -version
) | sed -u "s/^/  /"

echo -e "\nSuccess!"
exit 0
