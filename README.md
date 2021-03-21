# DMC-IPC
IAD position calculator

This is an IAD position calculator for the [IAD model].
The [IAD model] has 72 channels/addresses per blade and uses 3x 25 pair internal cable tails,
with each 25th pair dead meaning channel/address 25 is on the next cable. These 25 pairs are
installed on 3x 10 pair krone modules, and where there is more than 1 blade, the wiring is continued
on the empty pairs on the last krone module. This makes finding the channel/address difficult,
if you have more than 1 blade. That's where this program comes in.


It takes inputs from the user and calculates the IAD blade & channel/address (e.g. 1/1 or 2/24)
relative to a 10 pair krone block on a vertical & starting range that you specify (e.g. A, 201 or B, 301).

The positions are added to a .txt file and named IAD_[the name of your IAD here].txt

I made this as a bash script based off a Python3 code I made earlier.

Darcy
