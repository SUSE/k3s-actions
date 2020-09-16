# k3s Create Cluster

Creates a new k3s cluster.

## Inputs

| Name | Description | Required | Default |
| --- | --- | --- | --- |
| node_name | The k3s node name. | false | k3s |
| set_kubeconfig_env | Sets the KUBECONFIG environment variable to be available for the next steps.  | false | true |

## Outputs

| Name | Description |
| --- | --- |
| kubeconfig | The kubeconfig path for the k3s cluster admin. |
