# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance 

## dependencies

* lynx browser
* terminal-to-html (git submodule)

Actually not yet, the plan was to put to HTML but...

## What if the item should run at regular intervals?

It should make sure it runs and sends an email at a regular interval
It may run them in a loop @ a certain sleep interval
It store pids of its children, but disown them, and then be allowed to kill and restart them- for sleepers
It should printout of last sleeper

Something to check logs
Something to hook into multiple systems


