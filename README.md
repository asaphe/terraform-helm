# Helm Module

This Module will install a Helm Chart to a Kubernetes cluster in a given namespace.

## Assumptions

* AWS_PROFILE is set
* AWS_REGION is set
* KUBE_CONFIG_PATH is set

## Variables

| Name                    | Description                                                                                                         | Type      | Required   | Default                  |
|:------------------------|:-------------------------------------------------------------------------------------------------------------------:|:---------:|:----------:|:------------------------:|
| chart                   | Chart name to be installed                                                                                          | string    | **yes**    | n/a                      |
| name                    | Release name                                                                                                        | string    | **yes**    | n/a                      |
| namespace               | The namespace to install the release into                                                                           | string    | no         | default                  |
| create_namespace        | Create the namespace if it does not yet exist                                                                       | bool      | no         | false                    |
| repository              | Repository URL where to locate the requested chart                                                                  | string    | no         | n/a                      |
| chart_version           | Specify the exact chart version to install                                                                          | bool      | no         | latest                   |
| reuse_values            | When upgrading, reuse the last release's values. ignored if `reset_values`                                          | bool      | no         | false                    |
| reset_values            | When upgrading, reset the values to the ones built into the chart                                                   | bool      | no         | false                    |
| set                     | Value block with custom values to be merged with the values yaml                                                    | list(obj) | no         | n/a                      |
| set_sensitive           | Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff | list(obj) | no         | n/a                      |
| force_update            | Force resource update through delete/recreate if needed                                                             | bool      | no         | false                    |
| recreate_pods           | Perform pods restart during upgrade/rollback                                                                        | bool      | no         | false                    |
| cleanup_on_fail         | Allow deletion of new resources created in this upgrade when upgrade fails                                          | bool      | no         | false                    |
| max_history             | Maximum number of release versions stored per release                                                               | number    | no         | 0                        |
| wait                    | Will wait until all resources are in a ready state before marking the release as successful.                        | bool      | no         | true                     |
| lint                    | Run the helm chart linter during the plan                                                                           | bool      | no         | true                     |

## Set / Set Sensetive

The variables `set` and `set_sensitive` are lists of objects which expects that each object will have two key-value pairs.

```hcl
set = [{
  name = "prometheus.enabled"
  value = true
  },
  {
  name = "serviceAccount.create"
  value = true
  }
]

set_sensitive = [{
  name = "user.password"
  value = "example!"
  },
  {
  name = "root.token"
  value = "example-token"
  }
]
```
