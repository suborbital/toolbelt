# Suborbital toolbelt

## What's this?

Across all of our projects we have a few common tasks we need to do with every one of our projects:
* run golangci-lint
* fix up some code that makes the linter unhappy
* build the project binary

This docker image can take care of all of these things.

## Why?
In order to have a consistent experience and a central point where we can manage versions and reduce unnecessary custom dockerfiles in each of the projects' codebases, this toolbelt has been created.

Previously each service decided how to run linting, lint fixing, and building. Some run them via the host computer, requiring you to install binaries, some run them in docker containers. The versions are out of alignment, the Go versions are different, and so on.

So out of necessity and to reduce fragmentation, this image.

## How can you use this?

Coming soon.