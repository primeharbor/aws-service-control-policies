# Deny Changing Account Baseline

This policy is from the WellDoneCloud SCPs for [Sandbox accounts repository](aws-scps-for-sandbox-and-training-account).

This policy ensures that local admins cannot change the account configuration, including IAM Alias, alternate contacts, billing & payments, etc.

While designed to apply to Sandbox accounts, this is a good governance role to apply to all AWS accounts. It allows folks in the Organizational Management account leveraging the `OrganizationAccountAccessRole` to make these changes and works with the [pht-account-configurator](https://github.com/primeharbor/pht-account-configurator) StepFunction that configures new accounts.

## Policy

This policy adapted from:
https://github.com/welldone-cloud/aws-scps-for-sandbox-and-training-accounts/blob/main/scp-deny-changing-account-baseline-configuration.json

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "account:CloseAccount",
        "account:DeleteAlternateContact",
        "account:DisableRegion",
        "account:EnableRegion",
        "account:PutAlternateContact",
        "account:PutChallengeQuestions",
        "account:PutContactInformation",
        "billing:PutContractInformation",
        "billing:UpdateBillingPreferences",
        "billing:UpdateIAMAccessPreference",
        "iam:CreateAccountAlias",
        "iam:DeleteAccountAlias",
        "iam:DeleteAccountPasswordPolicy",
        "iam:UpdateAccountEmailAddress",
        "iam:UpdateAccountName",
        "iam:UpdateAccountPasswordPolicy",
        "invoicing:PutInvoiceEmailDeliveryPreferences",
        "organizations:LeaveOrganization",
        "payments:CreatePaymentInstrument",
        "payments:DeletePaymentInstrument",
        "payments:MakePayment",
        "payments:UpdatePaymentPreferences",
        "purchase-orders:AddPurchaseOrder",
        "purchase-orders:DeletePurchaseOrder",
        "purchase-orders:ModifyPurchaseOrders",
        "purchase-orders:UpdateConsoleActionSetEnforced",
        "purchase-orders:UpdatePurchaseOrder",
        "purchase-orders:UpdatePurchaseOrderStatus",
        "tax:BatchPutTaxRegistration",
        "tax:DeleteTaxRegistration",
        "tax:PutTaxInheritance",
        "tax:PutTaxInterview",
        "tax:PutTaxRegistration",
        "tax:UpdateExemptions"
      ],
      "Resource": "*",
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:role/NAME_OF_YOUR_CLOUD_ENGINEERING_ROLE",
            "arn:aws:iam::*:role/stacksets-exec-*",
            "arn:aws:iam::*:role/OrganizationAccountAccessRole"
          ]
        }
      }
    }
  ]
}
```