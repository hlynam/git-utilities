#!/bin/sh

# WARNING: This script will rewrite history
# WARNING: It changes the user name and email of some commits
# Don't do this if anyone has already cloned the public repo

# See:
# https://help.github.com/articles/changing-author-info/

# After running this script, then run:
# git push --force --tags origin 'refs/heads/*'


git filter-branch --env-filter '

OLD_EMAIL='old.email@example.com'
CORRECT_NAME="Joe Boggs"
CORRECT_EMAIL="joe.bloggs@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
	export GIT_COMMITTER_NAME="$CORRECT_NAME"
	export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
	then export GIT_AUTHOR_NAME="$CORRECT_NAME"
	export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

