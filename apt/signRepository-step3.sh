#!/bin/sh
# Import private key
cat ../pgp-key.private | gpg --import
# Sign the Release
cat dists/stable/Release | gpg --default-key rabbitcompany -abs > dists/stable/Release.gpg
# Combine Release and Release.gpg
cat dists/stable/Release | gpg --default-key rabbitcompany -abs --clearsign > dists/stable/InRelease
