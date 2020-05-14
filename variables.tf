variable "domain_name" {
  type = string
}

variable "subject_alternative_names" {
  type = list(string)
  default = []
}

variable "hosted_zone_id" {}

variable "validation_record_ttl" {
  default = "60"
}
