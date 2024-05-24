# KMS Key Protection

This SCP prevents the scheduled deletion of KMS Keys. It's intended to protect critical data from being made unavailable due to key deletion

## Policy
```json

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ProtectKeys",
            "Effect": "Deny",
            "Action": [
                "kms:ScheduleKeyDeletion"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```