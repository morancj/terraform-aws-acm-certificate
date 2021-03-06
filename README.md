# terraform-aws-acm-certificate

A Terraform module to create an Amazon Certificate Manager (ACM) certificate with Route 53 DNS validation.

## Usage

```hcl
resource "aws_route53_zone" "default" {
  name = "example.org"
}

module "cert" {
  source = "github.com/morancj/terraform-aws-acm-certificate?ref=1.0.1"

  providers = {
    aws.acm_account     = "aws.cert-account"
    aws.route53_account = "aws.route53-account"
  }

  domain_name               = "example.org"
  subject_alternative_names = [
    "staging.example.org",
    "*.example.org"
  ]
  hosted_zone_id            = "${aws_route53_zone.default.zone_id}"
  validation_record_ttl     = "60"
}
```

## Variables

- `domain_name` - Primary domain name associated with certificate
- `subject_alternative_names` - Subject alternative domain names
- `hosted_zone_id` - Route 53 hosted zone ID for `domain_name`
- `validation_record_ttl` - Route 53 record time-to-live (TTL) for validation record (default: `60`)
- `providers` - AWS Account from root folder

## Outputs

- `arn` - The Amazon Resource Name (ARN) of the ACM certificate
