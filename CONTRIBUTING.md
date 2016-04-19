# Contributing to Cloud9 Workspace Templates

We welcome contributions from the community and are pleased to have them. Please follow this guide when making pull requests:

1. Fork the repository
2. Create a new folder (See naming conventions below)
3. Create a Dockerfile in the new folder. (See Guidelines for some conventions and guidelines)
4. Create a `files` folder, and put a `check-environment` script in there with execute permissions. (See Smoke tests below for more information)
5. Test your new workspace. (see Smoke tests below for more information)
6. Make a PR after you've completed testing


## Style Guidelines
We try to stick to 'Shiny new commit styles' from github: https://github.com/blog/926-shiny-new-commit-styles
As well as git commit messages as you can find here: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html


## Guidelines
We will review any updates to images presented in PRs; they may not all get merged. New workspace types are welcome but can take a little longer to be reviewed and released on to production systems than minor fixes.

For an idea on what we would expect in a basic image, see `ws-default` or a basic language one like `ws-python`

* Any environment variables that need to be set in the user's environment should be in `/etc/profile.d/something.sh` where something is a relevant name. Using docker `ENV` tags will not work.

* Anything expected to be used by the user should be accessible on the $PATH for ubuntu user, and have permissions to access it. (enter your image and `sudo -u ubuntu -i bash -l` to simulate login and verify this.

* Files required to build the workspace go in a `files` directory.

* Files to be dropped in to the ubuntu home folder are to go in `files/workspace` (See ws-default for an example)

* Smoke tests are mandatory for all new image types

* Applications/functions to be accesible by the user should be in .profile rather than .bashrc, otherwise they may not be available to runners and result in unexpected behaviour for users

* Adding runners is optional but highly recommended. Currently we pull them out of this repo and host them internally, but including them in the .c9 folder of the workspace is a good start

## Requirements
- Naming conventions must be followed
- A sample project must be provided
- A badge in the form of `badge.png` must be provided in the workspace folder
- Smoke tests must be included
- Guidelines should be followed

## Naming conventions
All workspaces are named `ws-NAME` where NAME is a short and meaningful descriptor; i.e. `ws-python`, `ws-ruby` or `ws-wordpress`

## Smoke tests
Create a bash script called `check-environment` in the `files` folder of your workspace, make sure it has execute permissions. The script will be run within the context of the ubuntu user; so if something needs to run as root use sudo within the script. Anything environment/user specific such as NVM/RVM/etc should be accessible the same as starting the docker image with `-u ubuntu`. Our build system will verify that the script exits with a return code of 0 before allowing any images to be pushed to docker hub. Make sure to test anything you added to the workspace and want to continue to work in the future. No tests means no reliability which means no merging :)

The easiest way to run the tests is to use the included `templatectl` script. Just run `./templatectl ws-foo test` to test the workspace's `check-environment` script as well as all of it's parent workspaces ones.

## Testing runners/other GUI functionality
You can also run the Cloud9 SDK within your docker container to test things like new runners or other things within the container by using `./templatectl ws-foo run` and then the web UI will be available on port 8080.
