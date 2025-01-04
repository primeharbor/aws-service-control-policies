# Block public EBS Snapshots and AMIs

This policy will configure the EC2 Service to prevent the sharing of EBS Snapshots and AMIs to all AWS Customers. It does not prevent the direct sharing of a snapshot or AMI to specific AWS Accounts or Organizations.

## Declarative Policy
```json
{
  "ec2_attributes": {
    "exception_message": {
      "@@assign": "Sharing of Snapshots and AMIs is denied by Organizational Policy"
    },
    "image_block_public_access": {
      "state": {
        "@@assign": "block_new_sharing"
      }
    },
    "snapshot_block_public_access": {
      "state": {
        "@@assign": "block_all_sharing"
      }
    }
  }
}
```

If applied to the Root OU, **there will be no exceptions**. If you need to publish snapshots or AMIs for legitimate business reasons, you will need to create a dedicated sharing account/OU, and apply this policy to all the other accounts and OUs.