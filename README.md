# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance

## features

Just read the scripts in scripts/

* latest release of software (golang only right now)
* git repo trackinng updating/notification
* asks systemd if anything has failed
* logwatch and mtail (log summarizing and metric generating platform)
* automatic check for updates debian

## build

First of all, you can run it from the repo, and it will try to run the scripts. The scripts themselvees will describe whether or not they have their required dependencies and permissions.

You can install dependencies for the scripts you want, create permissions to have the script run with/out sudo, etc.

To install the program, I just softlinked to the binary from my local bin/

### dependencies

* bash
* git
* logwatch
* mtail- a git module if you want it

I have a PR open to google/mtail that allows building outside of GOPATH

"Installing" means copying the mtail +x to a PATH folder after running `make`

## Why?

**Why not run from systemd and use systemd timers?**

Too much to learn, not interested. I know bash.

**Why not using CRON?**

Because bash works fine. I like not distributing my audimatic over my system.

## What if the item should run at regular intervals?

* system monitor and stuff- resource usage, dmesg events
* cron-like functions
  * maximum and minimum frequency specifications, event driven, 
  * system news
* Something to send e-mails- configure gmail and...
* Something to hook into multiple systems
* what happens if something is removed from git... better git status with push
