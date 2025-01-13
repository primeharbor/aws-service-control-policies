# Prevent Public Snapshots

This prevents a user from making an EBS Snapshot public. It's an added measure of defense, but the EBS Snapshot Block Public Access is a better GuardRail. This SCP is here for posterity and possible future reference.

**Note:** There are no condition keys for the `rds:ModifyDBSnapshotAttribute` and `rds:ModifyDBClusterSnapshotAttribute` that allows an cloud administrator to prevent public RDS and RDS Cluster Snapshots. Boo.

## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventPublicSnapshot",
      "Effect": "Deny",
      "Action": [
        "ec2:ModifySnapshotAttribute"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "ec2:Add/group": [
            "all"
          ]
        }
      }
    }
  ]
}
```