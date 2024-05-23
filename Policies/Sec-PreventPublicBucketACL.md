{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventPublicBucketCannedACL",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": [
            "public-read-write",
            "public-read",
            "authenticated-read"
          ]
        }
      }
    },
    {
      "Sid": "PreventPublicBucketACLGrantFullControl",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-grant-full-control": [
            "uri=http://acs.amazonaws.com/groups/global/AllUsers",
            "uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
          ]
        }
      }
    },
    {
      "Sid": "PreventPublicBucketACLGrantRead",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-grant-read": [
            "uri=http://acs.amazonaws.com/groups/global/AllUsers",
            "uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
          ]
        }
      }
    },
    {
      "Sid": "PreventPublicBucketACLGrantReadACP",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-grant-read-acp": [
            "uri=http://acs.amazonaws.com/groups/global/AllUsers",
            "uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
          ]
        }
      }
    },
    {
      "Sid": "PreventPublicBucketACLGrantWrite",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-grant-write": [
            "uri=http://acs.amazonaws.com/groups/global/AllUsers",
            "uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
          ]
        }
      }
    },
    {
      "Sid": "PreventPublicBucketACLGrantWriteACP",
      "Effect": "Deny",
      "Action": [
        "s3:PutBucketAcl"
      ],
      "Resource": [
        "*"
      ],
      "Condition": {
        "StringEquals": {
          "s3:x-amz-grant-write-acp": [
            "uri=http://acs.amazonaws.com/groups/global/AllUsers",
            "uri=http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
          ]
        }
      }
    }
  ]
}