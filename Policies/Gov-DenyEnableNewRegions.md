# Limit Region Enablement

This policy prevents local account admins from enabling any of the AWS Opt-in Regions. In a well governed organization, you want to ensure that all security tooling and monitoring is enabled, and that requires coordination with Cloud Engineering and Security. This SCP ensures that only Admins from the Organizational Management Account can enable a new region to ensure that all parties are aware and coordinated.

This should be applied to the Root OU


## Service Control Policy
```json
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
          "aws:PrincipalArn": ["arn:aws:iam::*:role/OrganizationAccountAccessRole"]
        }
      }
    }
  ]
}
```