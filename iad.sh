#!/bin/bash

# Darcy McIntyre 21/03/2021 
# Based on the code I wrote in Python3

echo  "How many blades are on the IAD? "
read blade
echo  "What vertical are the tails located at? (A, B, C etc) "
read vert
echo  "Where pair on the vertical do the tails start? (1, 101, 201 etc) "
read position
echo  "What is the IAD called? "
read iad


blade_address=72

for x in $(seq 1 $blade); do							# For each blade you have,
	for i in $(seq 1 $blade_address); do					# and for each address e.g 1/1 or 1/23, calculate position.
		if [ $i -eq 25 ]; then						# Tail pair 25 is not in use, continue  x/25 at next pair.
			echo "V$vert $position NOT IN USE" >> IAD_$iad.txt
			((position=position+1))
			echo "V$vert $position $iad $x/$i" >> IAD_$iad.txt
			((position=position+1))
		elif [ $i -eq 50 ]; then					# Tail pair 50 is not in use, continue x/50 at next pair.
			echo "V$vert $position NOT IN USE" >> IAD_$iad.txt
			((position=position+1))
			echo "V$vert $position $iad $x/$i" >> IAD_$iad.txt
			((position=position+1))
		elif [ $i -eq 72 ]; then					# 72 is in use, but there is a pair after 72 on the tail
			echo "V$vert $position $iad $x/$i" >> IAD_$iad.txt 	# that is not in use (tail = 25 pairs).
			((position=position+1))					# So we go to the next blade after the pair not in use,
			echo "V$vert $position NOT IN USE" >> IAD_$iad.txt	# because 72 is at 74 (25 at 26, 50 at 52),
			((position=position+1))					# leaving 1 dead on the tail at 75.
		else
			echo "V$vert $position $iad $x/$i" >> IAD_$iad.txt 	# This line outputs all other positions,
			((position=position+1))					# That are mot 25, 50 and 72.
		fi
	done
done
exit 0
