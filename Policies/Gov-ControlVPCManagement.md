# Deny VPC Permissions

In an enterprise setting, you typically want your network team to manage VPCs to ensure consistency, connectivity, and unique CIDR allocations.

This Service Control Policy denies AWS accounts the ability to manage their own network infrastructure, unless performed by the `NAME_OF_YOUR_NETWORK_ADMIN_ROLE` role.

You'd typically apply these to all workload accounts. You might have a special role for sandbox accounts that would let some builders the ability to do these actions. You'd want to add that special role to the Condition aws:PrincipalArn condition.


## Service Control Policy
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": [
        "ec2:AcceptTransitGatewayMulticastDomainAssociations",
        "ec2:AcceptTransitGatewayPeeringAttachment",
        "ec2:AcceptTransitGatewayVpcAttachment",
        "ec2:AcceptVpcEndpointConnections",
        "ec2:AcceptVpcPeeringConnection",
        "ec2:AssociateRouteTable",
        "ec2:AssociateSubnetCidrBlock",
        "ec2:AssociateTransitGatewayMulticastDomain",
        "ec2:AssociateTransitGatewayRouteTable",
        "ec2:AssociateVpcCidrBlock",
        "ec2:AttachClassicLinkVpc",
        "ec2:AttachInternetGateway",
        "ec2:AttachVpnGateway",
        "ec2:CreateCarrierGateway",
        "ec2:CreateClientVpnEndpoint",
        "ec2:CreateClientVpnRoute",
        "ec2:CreateCustomerGateway",
        "ec2:CreateDefaultSubnet",
        "ec2:CreateDefaultVpc",
        "ec2:CreateDhcpOptions",
        "ec2:CreateEgressOnlyInternetGateway",
        "ec2:CreateInternetGateway",
        "ec2:CreateLocalGatewayRoute",
        "ec2:CreateLocalGatewayRouteTableVpcAssociation",
        "ec2:CreateManagedPrefixList",
        "ec2:CreateNatGateway",
        "ec2:CreateNetworkAcl",
        "ec2:CreateNetworkAclEntry",
        "ec2:CreateNetworkInsightsPath",
        "ec2:CreateRoute",
        "ec2:CreateRouteTable",
        "ec2:CreateSubnet",
        "ec2:CreateTransitGateway",
        "ec2:CreateTransitGatewayConnect",
        "ec2:CreateTransitGatewayConnectPeer",
        "ec2:CreateTransitGatewayMulticastDomain",
        "ec2:CreateTransitGatewayPeeringAttachment",
        "ec2:CreateTransitGatewayPrefixListReference",
        "ec2:CreateTransitGatewayRoute",
        "ec2:CreateTransitGatewayRouteTable",
        "ec2:CreateTransitGatewayVpcAttachment",
        "ec2:CreateVpc",
        "ec2:CreateVpcPeeringConnection",
        "ec2:CreateVpnConnection",
        "ec2:CreateVpnConnectionRoute",
        "ec2:CreateVpnGateway",
        "ec2:DeleteCarrierGateway",
        "ec2:DeleteClientVpnEndpoint",
        "ec2:DeleteClientVpnRoute",
        "ec2:DeleteCustomerGateway",
        "ec2:DeleteDhcpOptions",
        "ec2:DeleteEgressOnlyInternetGateway",
        "ec2:DeleteInternetGateway",
        "ec2:DeleteLocalGatewayRoute",
        "ec2:DeleteLocalGatewayRouteTableVpcAssociation",
        "ec2:DeleteManagedPrefixList",
        "ec2:DeleteNatGateway",
        "ec2:DeleteNetworkAcl",
        "ec2:DeleteNetworkAclEntry",
        "ec2:DeleteNetworkInsightsPath",
        "ec2:DeleteRoute",
        "ec2:DeleteRouteTable",
        "ec2:DeleteSubnet",
        "ec2:DeleteTransitGateway",
        "ec2:DeleteTransitGatewayConnect",
        "ec2:DeleteTransitGatewayConnectPeer",
        "ec2:DeleteTransitGatewayMulticastDomain",
        "ec2:DeleteTransitGatewayPeeringAttachment",
        "ec2:DeleteTransitGatewayPrefixListReference",
        "ec2:DeleteTransitGatewayRoute",
        "ec2:DeleteTransitGatewayRouteTable",
        "ec2:DeleteTransitGatewayVpcAttachment",
        "ec2:DeleteVpc",
        "ec2:DeleteVpcPeeringConnection",
        "ec2:DeleteVpnConnection",
        "ec2:DeleteVpnConnectionRoute",
        "ec2:DeleteVpnGateway",
        "ec2:ModifyClientVpnEndpoint",
        "ec2:ModifyManagedPrefixList",
        "ec2:ModifyTransitGateway",
        "ec2:ModifyTransitGatewayPrefixListReference",
        "ec2:ModifyTransitGatewayVpcAttachment",
        "ec2:ModifyVpcAttribute",
        "ec2:ModifyVpnConnection",
        "ec2:ModifyVpnConnectionOptions",
        "ec2:RejectTransitGatewayMulticastDomainAssociations",
        "ec2:RejectTransitGatewayPeeringAttachment",
        "ec2:RejectTransitGatewayVpcAttachment",
        "ec2:RejectVpcEndpointConnections",
        "ec2:RejectVpcPeeringConnection"
      ],
      "Resource": [
        "arn:aws:ec2:*:*:vpc/*",
        "arn:aws:ec2:*:*:client-vpn-endpoint/*",
        "arn:aws:ec2:*:*:dhcp-options/*",
        "arn:aws:ec2:*:*:internet-gateway/*",
        "arn:aws:ec2:*:*:route-table/*",
        "arn:aws:ec2:*:*:subnet/*",
        "arn:aws:ec2:*:*:transit-gateway-attachment/*",
        "arn:aws:ec2:*:*:transit-gateway-multicast-domain/*",
        "arn:aws:ec2:*:*:transit-gateway-route-table/*",
        "arn:aws:ec2:*:*:vpc-peering-connection/*",
        "arn:aws:ec2:*:*:vpc-gateway/*"
      ],
      "Condition": {
        "StringNotLike": {
          "aws:PrincipalArn": ["arn:aws:iam::*:role/NAME_OF_YOUR_NETWORK_ADMIN_ROLE"]
        }
      }
    }
  ]
}

```

