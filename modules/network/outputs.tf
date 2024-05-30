output "private_az_ids" {
  description = "Private subnet Ids"
  value       = [for subnet in aws_subnet.private : subnet.id]
}
