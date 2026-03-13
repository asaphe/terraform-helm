# terraform-helm

A Terraform module to install a Helm chart to a Kubernetes cluster.

## Usage

```hcl
module "nginx" {
  source = "github.com/asaphe/terraform-helm?ref=v2.0.0"

  name       = "nginx-ingress"
  namespace  = "ingress"
  chart      = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"

  chart_version    = "4.12.0"
  create_namespace = true

  values = [file("values.yaml")]

  set = [
    {
      name  = "controller.replicaCount"
      value = 2
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| helm | >= 3.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Release name | `string` | `null` | yes |
| chart | Chart name to be installed (local path, URL, or chart name if repository is specified) | `string` | `null` | yes |
| namespace | The namespace to install the release into | `string` | `null` | yes |
| repository | Repository URL where to locate the requested chart | `string` | `null` | no |
| chart_version | Exact chart version to install. If not specified, the latest version is installed | `string` | `null` | no |
| create_namespace | Create the namespace if it does not yet exist | `bool` | `false` | no |
| values | List of values in raw yaml to pass to helm. Values will be merged, in order, as Helm does with multiple -f options | `list(any)` | `[]` | no |
| set | Value block with custom values to be merged with the values yaml | `list(object)` | `[]` | no |
| set_list | Value block with custom list values to be merged with the values yaml | `list(object)` | `[]` | no |
| set_sensitive | Value block with custom sensitive values that won't be exposed in the plan's diff | `list(object)` | `[]` | no |
| upgrade_install | If true, equivalent to running `helm upgrade --install` | `bool` | `true` | no |
| take_ownership | If set, allows Helm to adopt existing resources not managed by the release | `bool` | `false` | no |
| atomic | If set, installation process purges chart on fail. Wait is set automatically | `bool` | `false` | no |
| timeout | Time in seconds to wait for any individual kubernetes operation | `number` | `300` | no |
| wait | Wait until all resources are ready before marking the release as successful | `bool` | `true` | no |
| lint | Run the helm chart linter during the plan | `bool` | `true` | no |
| force_update | Force resource update through delete/recreate if needed | `bool` | `false` | no |
| recreate_pods | Perform pods restart during upgrade/rollback | `bool` | `false` | no |
| cleanup_on_fail | Allow deletion of new resources created in this upgrade when upgrade fails | `bool` | `false` | no |
| max_history | Maximum number of release versions stored per release. 0 = no limit | `number` | `0` | no |
| reuse_values | When upgrading, reuse the last release's values and merge in any overrides | `bool` | `false` | no |
| reset_values | When upgrading, reset the values to the ones built into the chart | `bool` | `false` | no |
| skip_crds | If set, no CRDs will be installed | `bool` | `false` | no |
| replace | Re-use the given name, even if already used. Unsafe in production | `bool` | `false` | no |
| render_subchart_notes | Render subchart notes along with the parent | `bool` | `true` | no |
| disable_openapi_validation | Skip validation of rendered templates against the Kubernetes OpenAPI Schema | `bool` | `false` | no |
| disable_webhooks | Prevent hooks from running | `bool` | `false` | no |
| dependency_update | Run helm dependency update before installing the chart | `bool` | `false` | no |
| verify | Verify the package before installing it using provenance file | `bool` | `false` | no |
| keyring | Location of public keys used for verification | `string` | `null` | no |
| description | Set release description attribute (visible in the history) | `string` | `null` | no |
| devel | Use chart development versions too | `string` | `null` | no |
| repository_key_file | The repositories cert key file | `string` | `null` | no |
| repository_cert_file | The repositories cert file | `string` | `null` | no |
| repository_ca_file | The repositories CA file | `string` | `null` | no |
| repository_username | Username for HTTP basic authentication against the repository | `string` | `null` | no |
| repository_password | Password for HTTP basic authentication against the repository | `string` | `null` | no |

## set / set_sensitive / set_list

The `set`, `set_sensitive`, and `set_list` variables are lists of objects:

```hcl
set = [
  {
    name  = "prometheus.enabled"
    value = true
  },
  {
    name  = "serviceAccount.create"
    value = true
  }
]

set_sensitive = [
  {
    name  = "auth.password"
    value = var.db_password
  }
]

set_list = [
  {
    name  = "controller.extraArgs"
    value = ["--default-ssl-certificate=ingress/tls-secret"]
  }
]
```

## Outputs

| Name | Description |
|------|-------------|
| deployment | The full state of the helm deployment |
| helm_outputs | Formatted summary of chart, version, release, and namespace |
| helm_manifest | The rendered manifest of the release as JSON |

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.
