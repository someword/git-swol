# Git
Git is one of the unspoken required skills that you'll need to have regardless of what sort of devops style work you are doing.
Here we will cover a list of the basic skills you will need and some exercises.
## Basics

  * git clone - find some repos on github or gitlab and clone them.   You should be able to clone repos using https or ssh (eg: https://github.com/someword/git-swol.git or git@github.com:someword/git-swol.git).  You might find it handy to add the following to your .gitconfig file to change the URL you are going to clone.  This will ensure when cloning private repos you use your ssh key so you can get authorized to clone the repo.

`
[url "git@github.com:"]
        insteadOf = https://github.com/

`

  * git commit - when creating a message for your commit try to make it meaningful.   If you use a ticket system consider prexing your commit message with the ticket number.  A good commit message is a bit of an art form.  Not too verbose and not too short.  Some tips to take into consideration https://chris.beams.io/posts/git-commit/ but are not required to know.
  * git fetch and pull - what is the difference between the two and when would you use one vs the other.
  * git checkout - In git you can `checkout` any hash, branch, tag and probably other things.  Find a repo and do a `git log` on the repo and then `git checkout <HASH of commit>`.  Now use `git checkout -b` to create a feature branch and make a commit.  Switch back and forth between your branch and the master branch.
  * git push - Create a github repo online and then clone that repo to your workstation.   Now create a new feature branch in that repo and then push that feature branch to the origin repository.  What if you create another clone of this repo and checkout the feature branch and then make a new commit and push this branch up.   Now go back to your first clone and make a new commit and try to push it.  What happens?  How do you get your local branch in the first clone to be in a state whre you can push it up?   Also read up on `git push --force` why would you use this?
  * git remote - Clone a repo from somewhere and then run `git remote rm origin` and figure out how to add back the correct origin using `git remote add`.   What if you change the name of origin to notorigin does that matter?
  * git config - Think of the ~/.gitconfig file as you would your shell rc file.  Add alises and customize as you like.  An example of one of my personal aliases is `  recent = for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'`.  Also keep in mind you can create git aliases that run shell commands and feed that into other git commands.  It's not just limiited to aliasing git commands.
  * pull requests - Create a git repo online and then make a feature branch with some changes in it.  Then create a pull request and merge the pull request.  Then look at the logs on the master branch and see how it looks.  Something to consider wrt to pull requests.   If your feature branch has 10 commits that complete 1 task you should squash those commits into 1 commit so when you do your pull request it just has 1 commit with all of your changes.

## Exercises
  For all of these exercises you need to unpack the tar ball outside of an existing git repo.   Otherwise you will have two .git directories and things will become confusing.
  * squash commits - Take the gitercises.tar.gz file (normally you wouldn't put a binary into git but for this scenario we are) and uncompress it somewhere.   The squash branch has multiple commits to accomplish one unit of work.  Squash/rebase these commits down to 1 commit with all of the changes.    Bonus points would be to reword the git commit message.
  * rebase - Take the gitercises.tar.gz file (normally you wouldn't put a binary into git but for this scenario we are) and uncompress it somewhere.   The rebase branch has diverged from the master branch.   Before you submit a PR you would need to rebase your branch off of the master branch.  How do you get the missing commits from master onto the rebase branch.
  * cherrypick - while on the squash branch cherry pick the 2nd commit from the master branch onto the squash branch.

# References
  * https://git-scm.com/book/en/v2
  * https://www.codementor.io/citizen428/git-tutorial-10-common-git-problems-and-how-to-fix-them-aajv0katd
  * https://blog.cpanel.com/git-version-control-series-git-problems-and-how-to-fix-them/
