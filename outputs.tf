output "deployment" {
  value       = helm_release.this
  sensitive   = false
  description = "The state of the helm deployment."
}

output "helm_outputs" {
  value       = <<-EOF
    ######################### Helm Deploy #########################
     Chart:     ${helm_release.this.chart}
     Version:   ${helm_release.this.version}
     Release:   ${helm_release.this.name}
     Namespace: ${helm_release.this.namespace}
    ###############################################################
  EOF
  description = "Formatted summary of the helm deployment."
}

output "helm_manifest" {
  value       = helm_release.this.manifest
  description = "The rendered manifest of the release as JSON. Use yamldecode() for a human-readable version."
}
