# Import private key
gpg --import pgp-key.private

# Create macros
echo "%_signature gpg
%_gpg_name 96C9CDD34D8F2FAC" > /home/$USER/.rpmmacros

# Change directory
cd rpm

# Create the repository
createrepo .

# Sign the repodata metadata
gpg --detach-sign --armor repodata/repomd.xml