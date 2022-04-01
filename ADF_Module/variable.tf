variable "name_prefix" {
  type        = string
  default     = ""
  description = "prefix to form the name of resource"
}

variable "env"{
    type = string
    description = "Environment Name "
}

variable "location" {
  type = string
  
}

variable "rsg_name"{
    description = "Resource Group Name to create resources in "
}

variable "tags" {
    type = object
    description = "object of tag to add "
    default = {}
}