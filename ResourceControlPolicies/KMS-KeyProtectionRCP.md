# Prevent Key Deletion (RCP)

## Resource Control Policy
Adapted from [aws-samples/resource-control-policy-examples](https://github.com/aws-samples/resource-control-policy-examples/blob/main/Service-specific-controls/KMS-Deny-the-accidental-or-intentional-deletion-of-a-KMS-key-and-only-allow-specific-roles-to-delete-KMS-keys.json)
```json
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Effect":"Deny",
          "Principal":"*",
          "Action":[
             "kms:ScheduleKeyDeletion",
             "kms:DeleteAlias",
             "kms:DeleteCustomKeyStore",
             "kms:DeleteImportedKeyMaterial"
          ],
          "Resource":"*",
          "Condition":{
             "ArnNotLike":{
                "aws:PrincipalArn":"arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE"
             }
          }
       }
    ]
 }
 ```


