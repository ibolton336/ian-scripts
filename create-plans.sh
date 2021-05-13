#!/bin/bash
echo "create plan: $1"
mkcd ()
{
max=500
for (( i=2; i <= $max; ++i ))
do
    THIS_NAME="plan${i}"
    echo $THIS_NAME
    echo "Looping ... number $i"
    exec oc process -f plan-template.yaml -p PLAN_NAME=$THIS_NAME | oc create -f -
done
}
mkcd
 