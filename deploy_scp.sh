#!/bin/bash


for policy_file in Policies/*.json ; do
    policy=`basename $policy_file | sed s/.json//g`
    echo "Pushing $policy"

    desc_file="Policies/$policy.txt"
    if [ ! -f $desc_file ] ; then
        echo "$policy is missing a description file"
        continue
    fi
    description=`cat Policies/$policy.txt`

    echo "  ${description}"
    
    policy_id=`aws organizations list-policies --filter SERVICE_CONTROL_POLICY | jq --arg p "$policy" -c '.Policies[] | select( .Name | contains($p))' | jq -r .Id `
    if [ ! -z $policy_id ] ; then
        echo "$policy exists as $policy_id"
        aws organizations update-policy --policy-id ${policy_id} --content file://$policy_file --name $policy --description "$description" --output text | grep POLICYSUMMARY
    else
        echo "$policy doesn't exist yet"
        aws organizations create-policy --content file://$policy_file --name $policy --description "$description" --type SERVICE_CONTROL_POLICY --output text | grep POLICYSUMMARY
    fi
done

