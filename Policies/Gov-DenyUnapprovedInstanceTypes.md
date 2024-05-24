# Deny unapproved instance types

This sample policy can be used to ensure only specific EC2 Instance Types are launched. It's intended to ensure costs are managed.

It should be applied to the Sandbox OU, or anywhere you want to strongly control costs.

## Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "RequireInstanceType",
      "Effect": "Deny",
      "Action": "ec2:RunInstances",
      "Resource": [
        "arn:aws:ec2:*:*:instance/*"
      ],
      "Condition": {
        "StringNotEquals": {
          "ec2:InstanceType": [
            "t2.micro",
            "t4g.nano",
            "t4g.micro",
            "t3a.nano",
            "t3a.micro"
          ]
        }
      }
    }
  ]
}
```