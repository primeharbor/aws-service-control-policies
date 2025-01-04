# Block External Access to Organization's S3 Buckets

Public S3 Buckets are a major security problem for AWS Customers. There are hundreds of examples of AWS Customer's winning a Bucket Negligence Award for leaking sensitive information on their business or customers.

## Resource Control Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3DataPerimeter",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "*",
            "Condition": {
                "StringNotEqualsIfExists": {
                    "aws:PrincipalOrgID": "MY_ORG_ID"
                },
                "BoolIfExists": {
                    "aws:PrincipalIsAWSService": "false"
                }
            }
        }
    ]
}
```


If you have a list of approved public buckets you want to exclude from this rule, then you can use this policy which will block access to all buckets except the ones listed in the `NotResource` block.

We use the Object notation for the ARN (`my-public-bucket/*`), to ensure that the public access is only allowed for objects, and that a misconfigured bucket policy would not allow alterations to the bucket itself.
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3DataPerimeterWithApprovedExceptions",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "NotResource": [
                "arn:aws:s3:::my-public-bucket/*"
            ],
            "Condition": {
                "StringNotEqualsIfExists": {
                    "aws:PrincipalOrgID": "MY_ORG_ID"
                },
                "BoolIfExists": {
                    "aws:PrincipalIsAWSService": "false"
                }
            }
        }
    ]
}
```