# KMS Key Protection

This SCP prevents the scheduled deletion of KMS Keys. It's intended to protect critical data from being made unavailable due to key deletion.

For more about `kms:DeleteImportedKeyMaterial`, see [Effective Techniques for AWS Ransomware](https://www.chrisfarris.com/post/effective-aws-ransomware/).\
For more about `kms:DeleteCustomKeyStore`, see [Perfecting Ransomware on AWS](https://medium.com/@harsh8v/redefining-ransomware-attacks-on-aws-using-aws-kms-xks-dea668633802)

## Service Control Policy
```json

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ProtectKeys",
            "Effect": "Deny",
            "Action": [
                "kms:ScheduleKeyDeletion",
                "kms:DeleteCustomKeyStore",
                "kms:DeleteImportedKeyMaterial"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```