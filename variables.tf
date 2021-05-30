variable "atomic" {
  description = "(Optional) If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to false"
  type        = bool
  default     = false
}

variable "name" {
  description = "(Required) Release name"
  type        = string
  default     = null
}

variable "chart" {
  description = "(Required) Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended."
  type        = string
  default     = null
}

variable "chart_version" {
  description = "(Optional) Specify the exact chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = null
}

variable "repository" {
  description = "Repository URL where to locate the requested chart."
  type        = string
  default     = null
}

variable "repository_key_file" {
  description = "(Optional) The repositories cert key file"
  type        = string
  default     = null
}

variable "repository_cert_file" {
  description = "(Optional) The repositories cert file"
  type        = string
  default     = null
}

variable "repository_ca_file" {
  description = "(Optional) The Repositories CA File."
  type        = string
  default     = null
}

variable "repository_username" {
  description = "(Optional) Username for HTTP basic authentication against the repository."
  type        = string
  default     = null
}

variable "repository_password" {
  description = "(Optional) Password for HTTP basic authentication against the repository."
  type        = string
  default     = null
}

variable "devel" {
  description = "(Optional) Use chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored."
  type        = string
  default     = null
}

variable "verify" {
  description = "(Optional) Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. For more information see the Helm Documentation. Defaults to false."
  type        = bool
  default     = false
}

variable "keyring" {
  description = "(Optional) Location of public keys used for verification. Used only if verify is true. Defaults to /.gnupg/pubring.gpg in the location set by home"
  type        = string
  default     = null
}

variable "timeout" {
  description = "(Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
  type        = number
  default     = 300
}

variable "disable_webhooks" {
  description = "(Optional) Prevent hooks from running. Defaults to false"
  type        = bool
  default     = false
}

variable "namespace" {
  description = "(Required) The namespace to install the release into." # TF Resource defaults to default. we require a namespace to deploy to.
  type        = string
  default     = null
}

variable "create_namespace" {
  description = "(Optional) Create the namespace if it does not yet exist. Defaults to false."
  type        = bool
  default     = false
}

variable "reuse_values" {
  description = "(Optional) When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored. Defaults to false"
  type        = bool
  default     = false
}

variable "reset_values" {
  description = "(Optional) When upgrading, reset the values to the ones built into the chart. Defaults to false."
  type        = bool
  default     = false
}

variable "values" {
  description = "(Optional) List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options."
  type        = list(any) # Can be ["${file("values.yaml")}"] or [<<EOF args: ["--myargument"] EOF]
  default     = null
}

variable "set" {
  description = "(Optional) Value block with custom values to be merged with the values yaml."
  type = list(object({
    name  = string
    value = string
  }))
  default = null
}

variable "set_sensitive" {
  description = "(Optional) Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff."
  type = list(object({
    path  = string
    value = string
  }))
  default = null
}

variable "dependency_update" {
  description = "(Optional) Runs helm dependency update before installing the chart. Defaults to false."
  type        = bool
  default     = false
}

variable "force_update" {
  description = "(Optional) Force resource update through delete/recreate if needed. Defaults to false"
  type        = bool
  default     = false
}

variable "recreate_pods" {
  description = "(Optional) Perform pods restart during upgrade/rollback. Defaults to false"
  type        = bool
  default     = false
}

variable "cleanup_on_fail" {
  description = "(Optional) Allow deletion of new resources created in this upgrade when upgrade fails. Defaults to false"
  type        = bool
  default     = false
}

variable "max_history" {
  description = "Maximum number of release versions stored per release. Defaults to 0 (no limit)."
  type        = number
  default     = 0
}

variable "skip_crds" {
  description = "(Optional) If set, no CRDs will be installed. By default, CRDs are installed if not already present. Defaults to false"
  type        = bool
  default     = false
}

variable "render_subchart_notes" {
  description = "(Optional) If set, render subchart notes along with the parent. Defaults to true."
  type        = bool
  default     = true
}

variable "disable_openapi_validation" {
  description = "(Optional) If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema. Defaults to false."
  type        = bool
  default     = false
}

variable "replace" {
  description = "(Optional) Re-use the given name, even if that name is already used. This is unsafe in production. Defaults to false"
  type        = bool
  default     = false
}

variable "description" {
  description = "(Optional) Set release description attribute (visible in the history)."
  type        = string
  default     = null
}

variable "postrender" {
  description = "(Optional) Configure a command to run after helm renders the manifest which can alter the manifest contents."
  type = list(object({
    binary_path = string
  }))
  default = null
}

variable "wait" {
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true"
  type        = bool
  default     = true
}

variable "lint" {
  description = "Run the helm chart linter during the plan. Defaults to true"
  type        = bool
  default     = true
}