# Protect Backup Vaults

This SCP is intended to prevent a threat-actor who has gained admin permissions in an AWS account from conducting randsom operations and deleting AWS Backups. In this example, all protected Recovery Points have a tag of `aws_backup_bcp_tier`. For more information on how this SCP can be leveraged see [Deploying AWS Backup](https://www.primeharbor.com/blog/awsbackup/) on the PrimeHarbor blog.

This SCP should be applied to the Root OU.

## Service Control Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ProtectVaults",
      "Effect": "Deny",
      "Action": ["backup:DeleteBackupVault","backup:DeleteRecoveryPoint"],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:ResourceTag/aws_backup_bcp_tier": "*"
        },
        "StringNotLike": {
          "aws:PrincipalArn": ["arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE"]
        }
      }
    }
  ]
}
```
