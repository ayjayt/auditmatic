# auditmatic
auditmatic is a set of bashscripts used to facilitate system maintenance 

## dependencies

* lynx browser
* terminal-to-html (git submodule)

## config

There is a main script that runs, `main.sh`, and it is set to run scripts in `scripts`.
It may run them in a loop @ a certain sleep interval
It may run them immediately. If they run immediately, they can decide themselves whether or not they should update.
Use autodocker as a basic idea of how to create command line programs.

## todo

write minutes() and hours() and days() and weeks() all to convert to sections to a sleep loop.
It store pids of its children, but disown them, and then be allowed to kill and restart them
Something to check and list git repositories
Something to check updates
Something to check logs
Something to hook into multiple systems
something to keep track of upgrades
