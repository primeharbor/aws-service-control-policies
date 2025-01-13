# Account Takeover Prevention

This SCP is intended to prevent a threat actor with admin or root permissions in the account from disabling local logging, changing the owner of the account, or removing it from your organization.

This should be applied to the Root OU.

## Service Control Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ProtectCloudTrail",
            "Effect": "Deny",
            "Action": [
                "cloudtrail:DeleteTrail",
                "cloudtrail:PutEventSelectors",
                "cloudtrail:StopLogging",
                "cloudtrail:UpdateTrail"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "ProtectAccountSettings",
            "Effect": "Deny",
            "Action": [
                "aws-portal:Modify*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "DenyLeaveOrganization",
            "Effect": "Deny",
            "Action": [
                "organizations:LeaveOrganization"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```