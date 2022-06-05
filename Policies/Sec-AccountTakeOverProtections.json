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