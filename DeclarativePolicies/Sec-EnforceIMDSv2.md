# Enforce IMDSv2

This policy will configure the EC2 Service to require IMDSv2 in all accounts and regions.

## Declarative Policy
```json
{
    "ec2_attributes": {
      "instance_metadata_defaults": {
        "http_tokens": {
          "@@assign": "required"
        },
        "http_put_response_hop_limit": {
          "@@assign": 2
        },
        "http_endpoint": {
          "@@assign": "no_preference"
        },
        "instance_metadata_tags": {
          "@@assign": "no_preference"
        }
      },
      "exception_message": {
        "@@assign": "Per Organizational Policy, all EC2 Instances must launch with Tokens required with a max hop limit of 2."
      }
    }
  }
```

**There are no exceptions to this policy**, so it's advised to ensure no IMDSv1 calls are being made by reviewing the CloudWatch Metric [`MetadataNoToken`](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#tools-for-transitioning-to-imdsv2).

If you have a single account that needs to use IMDSv1, you can apply this policy to specific AWS Accounts override the root policy:
```json
"instance_metadata_defaults": {
    "http_tokens": {
        "@@assign": "no_preference"
    },
    "http_put_response_hop_limit": {
        "@@assign": "4"
    },
    "http_endpoint": {
        "@@assign": "no_preference"
    },
    "instance_metadata_tags": {
        "@@assign": "no_preference"
    }
}
```

