# Protect Block Public Access settings

This SCP prevents local admins from disabling four critical Block Public Access settings for:
1. Specific S3 Buckets
2. All S3 buckets in an account
3. EC2 Amazon Machine Images
4. EC2 EBS Snapshots

This Policy has exclusions for the AWS Organization Management Account role and the Central Cloud Administrator role.

The `OrganizationAccountAccessRole` can make these changes and works with the [pht-account-configurator](https://github.com/primeharbor/pht-account-configurator) StepFunction that configures new accounts.

This SCP should be applied to the Root OU.

## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventDisableBlockPublicAccess",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketPublicAccessBlock",
        "s3:PutAccountPublicAccessBlock",
        "ec2:DisableImageBlockPublicAccess",
        "ec2:DisableSnapshotBlockPublicAccess"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE",
            "arn:aws:iam::*:role/OrganizationAccountAccessRole"
          ]
        }
      }
    }
  ]
}
```