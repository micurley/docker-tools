# docker-tools

Various dockerized developer tools

## Getting Started

#### Machine Setup

```bash
# install Docker
open https://docs.docker.com/docker-for-mac/install/


bash ./dt start|debug|stop
# - start: spins up composed containers in background and redirects output to dev-server.log

# - debug: spins up composed containers in foreground streams output to terminal

# - stop: spins down composed containers

# - build: builds the requirments base image

# - shell: opens a bash shell in the flask container

# - nginx: opens a bash shell in the nginx container

# NOTE - stop and shell attempt to delete python bytecode files when done but may throw and error on diff systems
```

#### Release creation

The github release process is mostly automated with the help of some npm packages. Use these to automatically bump your sem var version, update the CHANGELOG.md, tag the branch, push to github and create a release using the new tag.

##### requirements

```bash
brew install node@latest
npm install -g release-it auto-changelog
```

##### release-it configuration

-   Github token: https://github.com/release-it/release-it#github-releases
-   Config file: [.release-it.json](./.release-it.json)
-   Changelog config file: [.auto-changelog](./.auto-changelog)

##### usage (type the following then follow the prompts)

```bash
release-it
```

## Make git a little easier to use | [Config](./git/config.txt)

This will provide useful git aliases and configuration

```
git config include.path ../git/config.txt
git config --global user.prefix <# personal branch name prefix - i.e. I use `mocurlz` #>
```

1. `git ls [-n #]` - outputs abbreviated git log from newest to oldest
    - optional `-n` followed by number of entries you want to see
2. `git lg [-n #]` - outputs abbreviated git graph log from oldest to newest
    - optional `-n` followed by number of entries you want to see
3. `git bclean [<# branch name #>]` - deletes merged branches relative to the branch provided
    - optional branch name provided[defaults to `develop`]
    - _Note_ : you must be on the branch you want to delete merged branches relative to
4. `git pr <pr #>` - fetch and checkout a new branch based on the PR # provided
5. `git cob <# new branch name #>` - create and checkout new branch name prefixed with your handle
6. `git pbo <# new branch name #>` - (<b><i>P</i></b>ush <b><i>B</i></b>ranch to <b><i>O</i></b>rigin) shortcut for `git push -u origin < #branch name# >`
7. `git bv` - list currently available local branches
8. `git s` - git status
9. `git stauts` - git status (I always misspell it this way)
10. `git mbc [branch name]` - (<b><i>M</i></b>erge <b><i>B</i></b>ase <b><i>C</i></b>urrent) identify the common commit between current branch and provided branch name (defaults to `develop`)
