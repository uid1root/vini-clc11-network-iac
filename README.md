## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ip_nat_1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/eip) | resource |
| [aws_eip.ip_nat_1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/eip) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.natgateway_1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.natgateway_1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_rt_1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table) | resource |
| [aws_route_table.private_rt_1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table) | resource |
| [aws_route_table.public_rt](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private-1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private-1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private-subnet-1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/subnet) | resource |
| [aws_subnet.private-subnet-1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1a](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/subnet) | resource |
| [aws_subnet.public-subnet-1c](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/subnet) | resource |
| [aws_vpc.minha_vpc](https://registry.terraform.io/providers/hashicorp/aws/5.45.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private_subnet_1a_range"></a> [private\_subnet\_1a\_range](#input\_private\_subnet\_1a\_range) | n/a | `string` | `"10.0.100.0/24"` | no |
| <a name="input_private_subnet_1c_range"></a> [private\_subnet\_1c\_range](#input\_private\_subnet\_1c\_range) | n/a | `string` | `"10.0.200.0/24"` | no |
| <a name="input_public_subnet_1a_range"></a> [public\_subnet\_1a\_range](#input\_public\_subnet\_1a\_range) | n/a | `string` | `"10.0.10.0/24"` | no |
| <a name="input_public_subnet_1c_range"></a> [public\_subnet\_1c\_range](#input\_public\_subnet\_1c\_range) | n/a | `string` | `"10.0.20.0/24"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Nome da sua VPC | `string` | `"vpc_vinicius_iac_clc11"` | no |
| <a name="input_vpc_range"></a> [vpc\_range](#input\_vpc\_range) | n/a | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
