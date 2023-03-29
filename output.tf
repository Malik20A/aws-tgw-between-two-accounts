output "account1_transit_gateway_id" {
  description = "Transit Gateway ID for Account 1"
  value       = aws_ec2_transit_gateway.account1_tgw.id
}

output "account2_transit_gateway_id" {
  description = "Transit Gateway ID for Account 2"
  value       = aws_ec2_transit_gateway.account2_tgw.id
}

output "account1_vpc_attachment_id" {
  description = "Transit Gateway VPC Attachment ID for Account 1"
  value       = aws_ec2_transit_gateway_vpc_attachment.account1_attachment.id
}

output "account2_vpc_attachment_id" {
  description = "Transit Gateway VPC Attachment ID for Account 2"
  value       = aws_ec2_transit_gateway_vpc_attachment.account2_attachment.id
}

output "transit_gateway_peering_attachment_id" {
  description = "Transit Gateway Peering Attachment ID"
  value       = aws_ec2_transit_gateway_peering_attachment.tgw_peering.id
}
