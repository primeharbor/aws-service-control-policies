#!/bin/bash

echo "Enabling SCPs for this account"
root_id=`aws organizations list-roots | jq -r .Roots[].Id`

aws organizations enable-policy-type --root-id $root_id --policy-type SERVICE_CONTROL_POLICY --output text

exit 0