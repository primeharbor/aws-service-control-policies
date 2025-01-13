# Prevent Publicly Invokable Lambda

This policy prevents two forms of Lambda function misconfiguration. The first statement prevents a builder from allowing _any_ AWS customer to invoke a function. The second statement prevents a builder from creating a Lambda Function URL with an authentication type other than AWS_IAM. If the value of `FunctionUrlAuthType` is `NONE`, then anyone with the function URL can curl said URL and invoke the function.

This SCP should be applied to the Workloads OU.

## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PreventPublicLambdaPolicy",
      "Effect": "Deny",
      "Action": ["lambda:AddPermission"],
      "Resource": ["*"],
      "Condition": {
        "StringEquals": {
          "lambda:Principal": ["*"]
        }
      }
    },
    {
      "Action": [
        "lambda:CreateFunctionUrlConfig",
        "lambda:UpdateFunctionUrlConfig"
      ],
      "Resource": "arn:aws:lambda:*:*:function/*",
      "Effect": "Deny",
      "Condition": {
        "StringNotEquals": {
          "lambda:FunctionUrlAuthType": "AWS_IAM"
        }
      }
    }
  ]
}

```