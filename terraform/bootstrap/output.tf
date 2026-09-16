output "s3_bucket_name" {
  description = "S3 bucket utilizado para Terraform State"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "DynamoDB table utilizada para State Locking"
  value       = aws_dynamodb_table.terraform_lock.name
}