# AWS Organizational Service Control Policies

## What Are Service Control Policies
[Service Control Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html) (aka SCPs) are similar to IAM policies but are applied by a parent AWS Account to a child AWS account via [AWS Organizations](https://aws.amazon.com/organizations/). They can white or blacklist services so not even the Root Account or a full IAM Administrator in the account can call the specified API actions.

With regard to Root, [AWS Documentation States:](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)

    No matter what SCPs are attached, the root user in an account can always do the following:
    * Changing the root user's password
    * Creating, updating, or deleting root access keys
    * Enabling or disabling multi-factor authentication on the root user
    * Creating, updating, or deleting x.509 keys for the root user

## Policies in this Repo

### [Security - Account takeover protection](Sec-AccountTakeOverProtections.md)
This is the basic Security Controls SCP you want to apply to all accounts (including the payer). It does the following:

* Denies the deletion, update or stopping of CloudTrail
* Denies the modification of the account contacts & settings via the Billing Portal and My Account Page
* Denies the account from leaving the organization

### [Security - Prevent Disabling Block Public Access](Sec-PreventDisableBlockPublicAccess.md)
This policy will deny "s3:PutBucketPublicAccessBlock" for all uses except the "SecurityExceptionRole".

Note: This API call will also prevent _enabling_ Block Public Access, and should be used in conjunction with an autoremediation that will automatically enable that on all buckets at creation time. That auto-remediation role will need to be in the list of excluded roles.

### [Security - Prevent Public Buckets via ACLs](Sec-PreventPublicBucketACL.md)
This SCP will prevent users from creating publicly readable or publicly writable buckets via the AWS CLI. It has numerous statements to cover a number of ways this can be done:
* Canned ACLs
* Specific Grants to default Groups (AllUsers & AuthenticatedUsers)

**Note:** This will prevent the most common ways of making a bucket listable or writable via the *AWS CLI*, however the AWS Console uses a different API call that cannot be filtered using the available set of condition keys. As of 2022, AWS does not let users make _writable_ buckets via the AWS Console, so this SCP should prevent any from of writable S3 bucket, but users can still make listable buckets via the AWS Console. You will continue to need to monitor user behavior with some form of Cloud Security Posture Monitoring to ensure no listable buckets.

### [Security - Prevent Public Lambda](Sec-PreventPubliclyInvocableLambda.md)
This SCP will deny all users the ability to AddPermission on a lambda for Principal: "*".

This should prevent all publicly invocable lambda, and may also help prevent LambdaURLs that use AuthType of None.

Public Lambda are a good example of what AWS describes as a Security Invariant, and so no roles are excluded from this SCP.

### [Governance - Prevent Accounts from enabling new regions](Gov-DenyEnableNewRegions.md)
Most new regions created after ap-east-1 (Hong Kong) require the account owner to explicitly enable them. However with AWS Organizations and Delegated admin, tooling like GuardDuty, Macie, etc are not enabled in those regions because the delegated admin isn't enabled in that region. This Governance control prevents an account owner from unilaterally enabling a region without first ensuring that the cloud governance and security tooling is in place.

This SCP excludes the OrganizationAccountAccessRole which may be assumed from the Organizations Management account for the cases where this may need to occur.

### [Governance - Disable usage of regions](Gov-DisableRegionsPolicy.md)
AWS does not allow customers to disable the 17 Default Regions. However your governance may dictate that only specific regions may be used. This sample policy lists a number of "global" services that should be able to run in all regions, while denying the use of all other actions in the regions not listed in the condition.

Some number of other roles are excluded from this SCP as part of Auditing functions and those roles should be adjusted for your needs.

### [Governance - Prevent modification of Critical Roles](Gov-PreventCriticalRoleModification.md)
This SCP prevents account owners from modifying the roles outlined in the Resource block. This prevents account owners from locking out security & governance functions or modifying AWS SSO roles.

Only the OrganizationAccountAccessRole and AWS CloudFormation Delegated Admin StackSet role are excluded from this SCP. The "stacksets-exec-" role is often used to deploy the governance roles.


### KMS Key Deletion Protection
Deploy this SCP on accounts with critical data where the deletion of a KMS key could lead to irrecoverable data loss.

Note that KMS Key Deletion is not usually considered a Security Invariant, however applying this control via the Organizational Management Account introduces an additional level of protection in the case the workload account is compromised.


