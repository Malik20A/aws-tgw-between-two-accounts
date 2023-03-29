resource "aws_ec2_transit_gateway" "account1_tgw" {
  provider = aws.account1

  description = "Transit Gateway for Account 1"
}

resource "aws_ec2_transit_gateway" "account2_tgw" {
  provider = aws.account2

  description = "Transit Gateway for Account 2"
}

data "aws_vpc" "account1_default_vpc" {
  provider = aws.account1

  default = true
}

data "aws_subnet_ids" "account1_default_vpc_subnet_ids" {
  provider = aws.account1

  vpc_id = data.aws_vpc.account1_default_vpc.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "account1_attachment" {
  provider             = aws.account1
  vpc_id               = data.aws_vpc.account1_default_vpc.id
  transit_gateway_id   = aws_ec2_transit_gateway.account1_tgw.id
  subnet_ids           = data.aws_subnet_ids.account1_default_vpc_subnet_ids.ids
}

data "aws_vpc" "account2_default_vpc" {
  provider = aws.account2

  default = true
}

data "aws_subnet_ids" "account2_default_vpc_subnet_ids" {
  provider = aws.account2

  vpc_id = data.aws_vpc.account2_default_vpc.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "account2_attachment" {
  provider             = aws.account2
  vpc_id               = data.aws_vpc.account2_default_vpc.id
  transit_gateway_id   = aws_ec2_transit_gateway.account2_tgw.id
  subnet_ids           = data.aws_subnet_ids.account2_default_vpc_subnet_ids.ids
}

resource "aws_ec2_transit_gateway_peering_attachment" "tgw_peering" {
  provider = aws.account1

  transit_gateway_id         = aws_ec2_transit_gateway.account1_tgw.id
  peer_transit_gateway_id    = aws_ec2_transit_gateway.account2_tgw.id
  peer_region                = "us-east-1"
}
