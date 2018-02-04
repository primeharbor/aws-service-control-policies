#!/bin/bash

echo "Applying Security Controls SCP to all accounts"
policy_id=`aws organizations list-policies --filter SERVICE_CONTROL_POLICY | jq --arg p "$policy" -c '.Policies[] | select( .Name | contains("SecurityControls"))' | jq -r .Id `
for account_id in `aws organizations list-accounts | jq -r .Accounts[].Id` ; do
    aws organizations attach-policy --policy-id $policy_id --target-id $account_id --output text
done

exit 0