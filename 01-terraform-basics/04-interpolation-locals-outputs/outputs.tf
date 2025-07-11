output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
  description = "The name of the S3 bucket created by this configuration."
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "The ARN of the S3 bucket created by this configuration."
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.this.bucket_domain_name
  description = "The domain name of the S3 bucket."

}

output "ips_file_path" {
  value       = "${aws_s3_bucket.this.bucket}/${aws_s3_object.this.key}"
  description = "The path to the IPs JSON file stored in the S3 bucket."

}
