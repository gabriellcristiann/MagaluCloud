terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
  }
}

provider "mgc" {
  api_key = var.mgc_api_key
  region  = var.region
}

variable "mgc_api_key" { type = string }
variable "region" { type = string }

resource "mgc_virtual_machine_instances" "this" {
  name         = "test_instance_terraform"
  machine_type = "BV1-1-40"
  image        = "cloud-rocky-09"
  ssh_key_name = "automation"
}



resource "mgc_object_storage_buckets" "this" {
  bucket           = "bucket-megaconecta-making"
  bucket_is_prefix = true
  private          = true
}

output "instance-name" {
  value = mgc_virtual_machine_instances.this.name
}