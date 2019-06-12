# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance

## features

I recommend reading the scripts in scripts/

* basic sysinfo
* latest release of software (golang only right now)
* git repo tracking updating/notification
* asks systemd if anything has failed
* logwatch and mtail (log summarizing and metric generating platform)
* automatic check for updates debian

## build

First of all, you can run it from the repo, and it will try to run the scripts. The scripts themselves will describe whether or not they have their required dependencies and permissions.

You can install dependencies for the scripts you want- the scripts themselves will indicate if they can run.

You can create permissions to have the script run with/out sudo, etc- you do this in with `visudo`, my file is as follows:
```
userName ALL=(ALL) NOPASSWD: /usr/sbin/logwatch
userName ALL=(ALL) NOPASSWD: /usr/bin/du
userName ALL=(ALL) NOPASSWD: /home/userName/go/bin/mtail
```
This allows certain commands to be run automatically


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
