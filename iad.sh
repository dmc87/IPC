#!/bin/bash

# Darcy McIntyre, D728212
# Based on the code I wrote in Python3

echo  "How many blades on the IAD? "
read blade
echo  "What verticle are the tails located at? "
read verticle
echo  "Where on the verticle do the tails start? "
read position
echo  "What is the IAD called? "
read iad


blade_address=72

for x in $(seq 1 $blade); do					# For each blade you have
	for i in $(seq 1 $blade_address); do			# and for each position e.g 1/1 or 1/23
		if [ $i -eq 25 ]; then				# 25 is not in use, continue at next verticle position
			echo "V$verticle $position NOT IN USE" >> IAD_$iad.txt
			((position=position+1))
			echo "V$verticle $position $iad $x/$i" >> IAD_$iad.txt
			((position=position+1))
		elif [ $i -eq 50 ]; then			# 50 is not in use, continue at next verticle position
			echo "V$verticle $position NOT IN USE" >> IAD_$iad.txt
			((position=position+1))
			echo "V$verticle $position $iad $x/$i" >> IAD_$iad.txt
			((position=position+1))
		elif [ $i -eq 72 ]; then			# 72 is in use, but there is a pair after 72 on the tail
			echo "V$verticle $position $iad $x/$i"	>> IAD_$iad.txt # that is not in use (tail = 25 pairs)
			((position=position+1))			# so we skip to the next blade after the pair not in use
			echo "V$verticle $position NOT IN USE" >> IAD_$iad.txt
			((position=position+1))
		else
			echo "V$verticle $position $iad $x/$i"	>> IAD_$iad.txt # This is for a regular position
			((position=position+1))
		fi
	done
done
exit 0
