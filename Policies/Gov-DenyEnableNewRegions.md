{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PreventAccountRegionChanges",
            "Effect": "Deny",
            "Action": ["account:EnableRegion","account:DisableRegion"],
            "Resource": ["*"],
            "Condition": {
                "StringNotLike": {
                    "aws:PrincipalArn": [
                        "arn:aws:iam::*:role/OrganizationAccountAccessRole"
                    ]
                }
            }
        }
    ]
}