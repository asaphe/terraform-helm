output "deployment" {
  value       = helm_release.this
  description = "The state of the helm deployment"
}

output "helm_outputs" {
  value = <<EOF
 ######################### Helm Deploy #########################
  Chart: "${helm_release.this.chart}"

  Release: "${helm_release.this.name}"
  Namespace: "${helm_release.this.namespace}"

  Version: "${helm_release.this.version}"

  Status: "${helm_release.this.status}"
 ###############################################################
  EOF
}