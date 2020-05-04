# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance

I keep it in my bashrc.

## features

I recommend reading the scripts in scripts/

Info it provides:

* basic sysinfo
* latest release of software (golang only right now)
* git repo tracking updating/notification
* asks systemd if anything has failed
* logwatch and mtail (log summarizing and metric generating platform)
* automatic check for updates (debian)

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

"Installing" mtail means copying the mtail +x to a PATH folder after running `make`

## Why?

**Why not run from systemd and use systemd timers?**

There is too much to learn, not interested. I know bash.

**Why not using CRON?**

Because bash works fine. I like not having to distribute my auditmatic over my system.

With auditmatic, I can go to one folder and look at all this system awareness/maintenance stuff.

## TODO

* up key always breaks
* system monitor and stuff- resource usage, dmesg events
* Something to send e-mails- configure gmail and...
* Make template
* ufw logs
* Something to hook into multiple system
* what happens if something is removed from git... better git status with push
* The README will be cleared up to demonstrate intent as a polling systemd/cron.
* Logwatchy stuff: ban ports, ban IPs for a certain length of time consecutively, filter the disconnects, just count if < 6 and sum- if you ban an IP get a geolocation or information aboutA
* Also, cover its installation and disabled exim


## Go/C Refactor

* The program will be refactored to either go or C. 
* SSH w/ basic multiplexing through libssh or x/crypto/ssh
* as well config files, probably YAML- minfreq, maxfreq, digest=this|then|whatever... even notification?, poll=true
* save last bash outout along with last run for each program for a certain lenght of time
* put something in your bashrc to run it
* grpc is good
