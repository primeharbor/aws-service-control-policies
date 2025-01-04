# Curated list of Security Invariants to enforce with Organizational Policies

AWS defines A security invariant as:
> a system property that relates to the system’s ability to prevent security issues from happening. Security invariants are statements that **will always hold true** for your business and applications.

A key clause here is that the invariant is always true, which means the exceptions to the invariant must be implemented as part of the invariant.

What follows is a collection of Security and Governance Invariants I like to enforce in my organizations:

# Governance Invariants

## Only the Network Engineering team may create a VPC, alter route tables, or attach an IGW.
Type: Service Control Policy\
Policy: [Gov-ControlVPCManagement](Policies/Gov-ControlVPCManagement.md)\
Exception: Deny unless made by the Cloud Networking Role


## Only Procurement may subscribe to or accept an offer in AWS Marketplace.
Type: Service Control Policy\
Policy: [Gov-DenyMarketplace](Policies/Gov-DenyMarketplace.md)\
Exception: Deny unless made by the Procurement Identity Center Role

## Only Cloud Engineering can enable new opt-in regions
(after ensuring GRC sign-off and the implementation of appropriate security telemetry and governance controls).

Type: Service Control Policy\
Policy: [Gov-DenyEnableNewRegions](Policies/Gov-DenyEnableNewRegions.md)\
Exception: Deny unless made by the Cloud Engineering Role

## Resources may only be deployed into the US or Europe Regions
Type: Service Control Policy\
Policy: [Gov-DisableRegionsPolicy](Policies/Gov-DisableRegionsPolicy.md)\
Exception: Deny unless the target region is in a list of approved regions.

Different Regional list can be applied to different OUs depending on business need. This policy excludes a number of auditing roles necessary to ensure nothing exists in the un-approved regions.


# General Security Invariants

## All new S3 Buckets must be created with ACLs disabled.
Type: Resource Control Policy\
Policy: [Sec-EnforceS3ACLDisabled](ResourceControlPolicies/Sec-EnforceS3ACLDisabled.md)\
Exception: The Cloud Engineering Role can create the bucket.

Note: This RCP only applies to bucket creation. A user could enable ACLs post creation.


## Only approved External AWS Accounts may assume into our organization
Type: Resource Control Policy\
Policy: [Sec-AssumeRoleApproval](ResourceControlPolicies/Sec-AssumeRoleApproval.md)


## Only Cloud Engineering, coming from the Atlanta office or VPN, may log in as root
Type: Service Control Policy\
Policy: [Sec-RootUsage](Policies/Sec-RootUsage.md)

## Only the Cloud Engineering Team may Delete a custom key store or imported key material, and the deletion must be done from the office
Type: Resource Control Policy\

## No one may alter the core security & governance IAM Roles
Type: Service Control Policy\
Policy: [Gov-PreventCriticalRoleModification](Policies/Gov-PreventCriticalRoleModification.md)



## All EC2 Instances must launch with IMDSv2
Type: Declarative Policy\
Policy: [Sec-EnforceIMDSv2](DeclarativePolicies/Sec-EnforceIMDSv2.md)

# Public Resource Protection

## Only the Security and Privacy team may make an S3 Bucket Public
???
https://github.com/aws-samples/resource-control-policy-examples/blob/main/Service-specific-controls/S3-Deny-users-from-modifying-S3-Block-Public-Access-(Account-Level).json
https://github.com/aws-samples/resource-control-policy-examples/blob/main/Service-specific-controls/S3-Prevent-S3-buckets-from-being-made-public-(Bucket-level).json


## AMIs and SnapShots may never be shared with all AWS accounts
Type: Declarative Policy\
Policy: [Sec-PreventPublicImageSnapshot](DeclarativePolicies/Sec-PreventPublicImageSnapshot.md)

(Optional Clause: "unless shared from the product publishing AWS account").

## KMS Keys and Secrets Manager Secrets must not be shared outside of our organization
Type: Resource Control Policy\
Policy: [Sec-ProtectKMSandSecrets](ResourceControlPolicies/Sec-ProtectKMSandSecrets.md)

## Lambda functions may not be publicly invocable or leverage unauthenticated Function URLs.
Type: Service Control Policy\
Policy: [Sec-PreventPubliclyInvocableLambda](Policies/Sec-PreventPubliclyInvocableLambda.md)




