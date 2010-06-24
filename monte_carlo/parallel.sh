#!/bin/bash
python parallel.py
for ((i=2,i<26,i++))
{
rsh 10.0.0.$i "nohup python phasetransition_parallel.py > rand.out &"

}
