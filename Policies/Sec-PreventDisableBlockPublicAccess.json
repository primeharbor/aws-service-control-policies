{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventDisableBlockPublicAccess",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketPublicAccessBlock"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/SecurityExceptionRole"
          ]
        }
      }
    }
  ]
}