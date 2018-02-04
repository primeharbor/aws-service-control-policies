# AWS Organizational Service Control Policies

**Sad Panda** - There is no Cloudformation support for Organizations & Service Control Policies, so all of this must be done by hand.

## What Are Service Control Policies
[Service Control Policies](url) (aka SCPs) are similar to IAM policies but are applied by a parent AWS Account to a child AWS account via [AWS Organizations](url). They can white or blacklist services so not even the Root Account or a full IAM Administrator in the account can call the specified API actions. 

With regard to Root, [AWS Documentation States:](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)

    No matter what SCPs are attached, the root user in an account can always do the following:
    * Changing the root user's password
    * Creating, updating, or deleting root access keys
    * Enabling or disabling multi-factor authentication on the root user
    * Creating, updating, or deleting x.509 keys for the root user

## Policies in this Repo

### Security Controls
This is the basic Security Controls SCP you want to apply to all accounts (including the payer). It does the following:

* Denies the deletion, update or stopping of CloudTrail
* Denies the modification of the account contacts & settings via the Billing Portal and My Account Page
* Denies the account from leaving the organization

Additional things that would be important are:

* Limiting the ability to turn off guard-duty

### Other Sample policies to follow
* Disable Consumer Features (ie Alexa for Business, WorkMail, etc)
* Disable use of regions (if possible)
* Disable the use of Managed AWS Policies

There is an open question as to whether or not SCPs can support IAM Conditional Context Keys

## Deployment Process

You must first run the ```enable_scp.sh``` script to enable the usage of SCPs in your organization. 

To deploy all the SCPs in the Policies directory, run:

	./deploy_scp.sh

To attach the Security Controls SCP to all AWS accounts, run:

	./apply_scp.sh

you didn't run ```enable_scp.sh``` if you get the error: ```An error occurred (PolicyTypeNotEnabledException) when calling the AttachPolicy operation: This operation can be performed only for enabled policy types.``` 

### Prerequisites
To run the scripts, you need the following:

* jq
* awscli
* credentials in the ~/.aws/credentials file or environment variables