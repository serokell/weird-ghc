Weird GHC.

Clone this repo and run `./bug.sh 1` or `./bug.sh 2` for a reproduction.

The script basically compiles the Main file that you chose, runs it
to make sure everything is fine, then makes a minor change to the
source code, and recompiles the Main file. What happens next depends
on which of two Main files you choose.
