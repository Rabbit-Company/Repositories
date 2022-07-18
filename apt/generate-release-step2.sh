#!/bin/sh
set -e

cd dists/stable

do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:" >> Release
    for f in $(find -type f); do
        f=$(echo $f | cut -c3-) # remove ./ prefix
        if [[ "$f" = "Release" || "$f" = "Release.gpg" || "$f" = "InRelease" ]]; then
            continue
        fi
        echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)" >> Release
    done
}

echo "Origin: Rabbit Company" > Release
echo "Label: RabbitCompany" >> Release
echo "Suite: stable" >> Release
echo "Codename: stable" >> Release
echo "Version: 1.0" >> Release
echo "Architectures: amd64 arm64 arm7" >> Release
echo "Components: main" >> Release
echo "Description: Rabbit Company software repository" >> Release
echo "Date: $(date -Ru)" >> Release
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"
