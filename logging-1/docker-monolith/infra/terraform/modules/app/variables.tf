variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "docker-reddit-base-1644308331"
}
variable subnet_id {
  description = "Subnets for modules"
  default = "e9buirteb16tfp7aed42"
}
