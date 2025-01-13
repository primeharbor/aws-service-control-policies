# Organizational Policies

Organizational Policies enable you to apply additional types of management to the AWS accounts in your organization. These are key capabilities to ensure that your security and governance controls are enforced consistently, regardless if the privileges granted to the calling principal.

This repo contains example Organizational Policies for the following types:
* [Service Control Policies](Policies/README.md)
* [Resource Control Policies](ResourceControlPolicies)
* [Declarative Policies](DeclarativePolicies)
* [AI Opt Out Policy](AI_OPTOUT.md)

These Organizational Policies can be used to enforce [Security Invariants](Invariants.md) - *properties that relates to the system’s ability to prevent security issues from happening. Security invariants are statements that **will always hold true** for your business and applications.*

There exist other Organizational Policies that are not (yet) part of this Repo:
* Tag Policies
* Chatbot Policies
* Backup Policies - But see [pht-awsbackup-management](https://github.com/primeharbor/pht-awsbackup-management) for how Backup Policies and Service Control Policies can be used to prevent a ransomware operator from destroying your backups.

**Warning**: RCPs and SCPs do not apply to the Organizational Management Account. If you need to enforce invariants in your management account, you will need to use and apply Permissions Boundaries. See [Implementing Security Invariants in an AWS Management Account](https://www.primeharbor.com/blog/payer-invariants/) for more.