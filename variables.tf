variable "location" {
  type    = string
  default = "westeurope"
}

variable "rg_name" {
  type    = string
  default = "rg-thns-vmss-win"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Custom tags associated with every resource"
}

variable "address_space_vnet" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Virtual Network address space"
}

variable "address_space_vmss_subnet" {
  type        = string
  default     = "10.0.0.0/24"
  description = "VMSS subnet address space"
}

variable "vmss_instances" {
  type    = number
  default = 2
}

variable "vmss_sku" {
  type        = string
  default     = ""
  description = "VMSS SKU Name"
}

variable "vmss_timezone" {
  type        = string
  default     = "W. Europe Standard Time"
  description = "Timezone configured on each VM of the VMSS"
}

variable "vmss_admin_user" {
  type    = string
  default = "thnsadmin"
}

variable "vmss_admin_password" {
  type = string
}

variable "vmss_source_image_publisher" {
  type    = string
  default = "Microsoft"
}

variable "vmss_source_image_offer" {
  type    = string
  default = "WindowsServer"
}

variable "vmss_source_image_sku" {
  type    = string
  default = "2019-Datacenter"
}

variable "vmss_source_image_version" {
  type    = string
  default = "latest"
}

variable "monitor_autoscaling_profile_name" {
  type        = string
  default     = "default-autoscale-profile"
  description = "Name used for the VMSS autoscaling profile"
}

variable "monitor_autoscaling_min" {
  type        = number
  default     = 2
  description = "Lower boundary for VMSS autoscaling"
}

variable "monitor_autoscaling_max" {
  type        = number
  default     = 4
  description = "Upper boundary for VMSS autoscaling"
}

variable "monitor_autoscaling_notification_mails" {
  type        = list(any)
  default     = ["noreply@thorsten-hans.com"]
  description = "Emails used for autoscaling notifications"
}
