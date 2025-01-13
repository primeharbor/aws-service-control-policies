# Disable Root Usage

This policy will deny all usage of the root user. It's intended to ensure proper account owners don't use root, and prevent threat actors who compromise an email from using root.

It's a compensating control for not enabling MFA for root on accounts created via AWS Organizations.

Note: SCPs do not apply to the Organization Management Account. Therefore that account _must_ have MFA enabled, preferably in the possession of multiple people, or on a easily accessible location.

This SCP should be applied to the Root OU.

## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRootUsage",
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": ["arn:aws:iam::*:root"]
        }
      }
    }
  ]
}
```

The following SCP allows root usage from one IP Address only:
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyRootUsage",
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": ["arn:aws:iam::*:root"]
        },
        "NotIpAddress": {
          "aws:SourceIp": "1.2.3.4"
        }
      }
    }
  ]
}
```