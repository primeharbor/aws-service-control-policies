# Prevent KMS & Secrets Management from outside the organization

This policy will prevent an external principal from accessing any KMS Keys or Secrets Manager Secrets. In most cases this should never be needed, and this adds an extra layer of protection.


## Resource Control Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DataPerimeter",
            "Effect": "Deny",
            "Principal": "*",
            "Action": [
              "secretsmanager:*",
              "kms:*",
            ],
            "Resource": "*",
            "Condition": {
                "StringNotEqualsIfExists": {
                    "aws:PrincipalOrgID": "DEFINE_YOUR_ORG_ID_HERE"
                },
                "BoolIfExists": {
                    "aws:PrincipalIsAWSService": "false"
                }
            }
        }
    ]
}
```


If you need to exclude one or more Keys or Secrets, you can use `NotResource` and list the excluded resources
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DataPerimeter",
            "Effect": "Deny",
            "Principal": "*",
            "Action": [
              "secretsmanager:*",
              "kms:*",
            ],
            "NotResource": [
                "arn:aws:kms:*:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab",
                "arn:aws:secretsmanager:us-east-1:111122223333:secret:SecretName-*"
            ],
            "Condition": {
                "StringNotEqualsIfExists": {
                    "aws:PrincipalOrgID": "DEFINE_YOUR_ORG_ID_HERE"
                },
                "BoolIfExists": {
                    "aws:PrincipalIsAWSService": "false"
                }
            }
        }
    ]
}
```