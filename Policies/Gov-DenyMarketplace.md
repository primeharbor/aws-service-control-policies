# Deny Marketplace Subscriptions

The purpose of the SCP is to govern who can make marketplace subscriptions. Marketplace allows local account admins the ability to bypass enterprise procurement and third-party risk management and engage and pay for services via their AWS Bill.

This SCP should be applied to the Root OU.

## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "MarketplaceWriteActions",
      "Effect": "Deny",
      "Action": [
        "aws-marketplace:AcceptAgreementApprovalRequest",
        "aws-marketplace:CancelAgreementRequest",
        "aws-marketplace:RejectAgreementApprovalRequest",
        "aws-marketplace:Subscribe",
        "aws-marketplace:Unsubscribe",
        "aws-marketplace:UpdateAgreementApprovalRequest"
      ],
      "Resource": ["*"],
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE",
            "arn:aws:iam::*:role/OrganizationAccountAccessRole"
          ]
        }
      }
    },
    {
      "Sid": "DenyAllPrivateMarketplaceActions",
      "Effect": "Deny",
      "Action": [
        "aws-marketplace:CreatePrivateMarketplace",
        "aws-marketplace:StartPrivateMarketplace",
        "aws-marketplace:StopPrivateMarketplace",
        "aws-marketplace:DescribePrivateMarketplaceStatus",
        "aws-marketplace:AssociateProductsWithPrivateMarketplace",
        "aws-marketplace:DisassociateProductsFromPrivateMarketplace",
        "aws-marketplace:ListPrivateMarketplaceProducts",
        "aws-marketplace:DescribePrivateMarketplaceProducts",
        "aws-marketplace:ListPrivateMarketplaceRequests",
        "aws-marketplace:DescribePrivateMarketplaceRequests",
        "aws-marketplace:UpdatePrivateMarketplaceSettings",
        "aws-marketplace:DescribePrivateMarketplaceSettings",
        "aws-marketplace:CreatePrivateMarketplaceProfile",
        "aws-marketplace:UpdatePrivateMarketplaceProfile",
        "aws-marketplace:DescribePrivateMarketplaceProfile"
      ],
      "Resource": ["*"],
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE",
            "arn:aws:iam::*:role/OrganizationAccountAccessRole"
          ]
        }
      }
    }
  ]
}



```
