# Prevent the creation of Buckets with ACLs

This policy ensures that all S3 Buckets that are _created_ disable ACLs (`BucketOwnerEnforced`).

## Resource Control Policy
Policy adapted from [aws-samples/resource-control-policy-examples](https://github.com/aws-samples/resource-control-policy-examples/blob/main/Service-specific-controls/S3-Deny-ACL-disablement-for-all-new-buckets-(bucket-owner-enforced).json)
```json
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Effect":"Deny",
          "Principal":"*",
          "Action":"s3:CreateBucket",
          "Resource":"*",
          "Condition":{
             "StringNotEquals":{
                "s3:x-amz-object-ownership":"BucketOwnerEnforced"
             }
          }
       }
    ]
 }
 ```