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