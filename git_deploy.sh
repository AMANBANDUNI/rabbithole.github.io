# To check existing config list
git config --list

# update right github details if wrong

git config user.name amanbanduni
git config user.email abanduni.5@gmail.com


# Set github ssh connection

eval "$(ssh-agent -s)"

# choose the right ssh key whose public key is mentioned in the above github account
ssh-add ~/.ssh/ecwr

# Test the github ssh connection
ssh -T git@github.com
