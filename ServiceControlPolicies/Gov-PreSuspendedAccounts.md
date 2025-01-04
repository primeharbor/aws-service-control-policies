# Disable Pre-Suspended Accounts

This SCP denies almost all actions in accounts that are about to be suspended. It's intended to be a scream-test before the account is officially suspended/closed.

This should be applied to the Suspended Accounts OU.

## Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventActionsInSuspendedOU",
      "Effect": "Deny",
      "NotAction": [
        "support:*",
        "ce:*",
        "aws-portal:ViewBilling",
        "budgets:*"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "ArnNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/security-audit",
            "arn:aws:iam::*:role/OrganizationAccountAccessRole",
            "arn:aws:iam::*:role/stacksets-exec-*",
            "arn:aws:iam::*:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig"
          ]
        }
      }
    }
  ]
}
```