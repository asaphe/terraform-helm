resource "helm_release" "this" {
  atomic                     = var.atomic
  name                       = var.name

  namespace                  = var.namespace
  create_namespace           = var.create_namespace

  repository                 = var.repository
  repository_key_file        = var.repository_key_file
  repository_cert_file       = var.repository_cert_file
  repository_ca_file         = var.repository_ca_file
  repository_username        = var.repository_username
  repository_password        = var.repository_password

  chart                      = var.chart
  version                    = var.chart_version
  devel                      = var.devel

  verify                     = var.verify
  keyring                    = var.keyring

  reuse_values               = var.reuse_values
  reset_values               = var.reset_values

  force_update               = var.force_update
  recreate_pods              = var.recreate_pods

  cleanup_on_fail            = var.cleanup_on_fail
  max_history                = var.max_history

  timeout                    = var.timeout
  wait                       = var.wait
  lint                       = var.lint

  disable_webhooks           = var.disable_webhooks
  skip_crds                  = var.skip_crds

  replace                    = var.replace
  render_subchart_notes      = var.render_subchart_notes
  disable_openapi_validation = var.disable_openapi_validation
  dependency_update          = var.dependency_update

  values     = var.values == null ? [] : var.values

  dynamic "postrender" {
    iterator = item
    for_each = var.postrender == null ? [] : var.postrender

    content {
      binary_path = item.value.value
    }
  }

  dynamic "set" {
    iterator = item
    for_each = var.set == null ? [] : var.set

    content {
      name  = item.value.name
      value = item.value.value
    }
  }

  dynamic "set_sensitive" {
    iterator = item
    for_each = var.set_sensitive == null ? [] : var.set_sensitive

    content {
      name  = item.value.path
      value = item.value.value
    }
  }
}