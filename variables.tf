variable "project_name" {
  description = "default project name"
  type        = string
  default     = "next-2024"
}

variable "default_region" {
  description = "default region for the project deployment"
  type        = string
  default     = "us-west1"
}

variable "deployment_regions" {
  description = "regions to deploy"
  type        = list(string)
  default     = ["us-central1", "us-west1", "us-east1"]
}