# Protect Critical Roles

This policy prevents local admins from modifying critical roles in their accounts.

Additional security or governance roles should be added to the `Resource` block.

This should be applied at the Root OU.

## Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PreventRoleModification",
            "Effect": "Deny",
            "Action": [
                "iam:AttachRolePolicy",
                "iam:DeleteRole",
                "iam:DeleteRolePermissionsBoundary",
                "iam:DeleteRolePolicy",
                "iam:DetachRolePolicy",
                "iam:PutRolePermissionsBoundary",
                "iam:PutRolePolicy",
                "iam:UpdateRole",
                "iam:UpdateRoleDescription",
                "iam:UpdateAssumeRolePolicy"
            ],
            "Resource": [
                "arn:aws:iam::*:role/security-audit",
                "arn:aws:iam::*:role/OrganizationAccountAccessRole",
                "arn:aws:iam::*:role/stacksets-exec-*",
                "arn:aws:iam::*:role/aws-reserved/sso.amazonaws.com/AWSReservedSSO*"
            ],
            "Condition": {
                "StringNotLike": {
                    "aws:PrincipalArn": [
                        "arn:aws:iam::*:role/stacksets-exec-*",
                        "arn:aws:iam::*:role/OrganizationAccountAccessRole"
                    ]
                }
            }
        }
    ]
}
```