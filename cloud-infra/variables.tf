#####################################################
# GENERAL VARIABLES
#####################################################
variable "location" {
  description = "Azure region for resources. Default is West Europe"
  default     = "westeurope"
}

variable "loc_abbreviation" {
  description = "Location abbreviation for resource naming"
  default = "we"
}

variable "prefix" {
  description = "Prefix for the resource naming"
  default = "kz"
}

variable "env_type" {
  description = "Environment Type abbreviation."
  default = "poc"
}