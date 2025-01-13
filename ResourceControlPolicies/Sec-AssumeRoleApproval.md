# Only Permit Assume Role from Trusted accounts or Organizations

This Resource Control Policy will prevent unauthorized AWS accounts from assuming a role into your organization. You can use this in conjunction with a robust third-party risk management program to ensure only approved vendors have access.

## Resource Control Policy
```json
{
    "Version":"2012-10-17",
    "Statement":[
       {
          "Effect":"Deny",
          "Principal":"*",
          "Action":"sts:AssumeRole",
          "Resource":"*",
          "Condition":{
             "StringNotEquals":{
                "aws:PrincipalOrgID": [
                    "INSERT MY ORG HERE"
                ],
                "aws:PrincipalAccount": [
                    "123456789012",
                    "LIST OF OTHER TRUSTED ACCOUNTS"
                ]
             }
          }
       }
    ]
 }
 ```

 The Condition logic here is to DENY if the assuming principal is NOT a member of my org, AND is NOT in the list of trusted accounts.