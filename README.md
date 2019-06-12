# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance 

## dependencies

* lynx browser
* terminal-to-html (git submodule)

Actually not yet, the plan was to put to HTML but...

* mtail

I have a PR open to google/mtail that allows building outside of GOPATH

"Installing" means copying the mtail +x to a PATH folder after running `make`


## What if the item should run at regular intervals?

system monitor and stuff- resource usage, dmesg events
mtail statefulness:w
cron-like functions
- maximum and minimum frequency specifications, event driven, 
- system news
Something to send e-mails- configure gmail and...
Something to hook into multiple systems

what happens if something is removed from git... better git status with push
