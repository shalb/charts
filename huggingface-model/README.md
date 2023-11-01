# Helm chart for deploy Hugging Face to kubernetes cluster. 

See [Hugging Face models](https://huggingface.co/models)

## Parameters

### Model

| Name                        | Description                                          | Value                                                 |
| --------------------------- | ---------------------------------------------------- | ----------------------------------------------------- |
| `model.organization`        | Models' company name on huggingface, required!       | `""`                                                  |
| `model.name`                | Models' name on huggingface, required!               | `""`                                                  |
| `init.s3.enabled`           | Turn on/off s3 data source Default: disabled         | `false`                                               |
| `init.s3.bucketURL`         | Full s3 URL included path to model's folder          | `s3://k8s-model-zephyr/llm/deployment/segmind/SSD-1B` |
| `huggingface.containerPort` | Deployment/StatefulSet ContainerPort, optional       | `8080`                                                |
| `huggingface.args`          | Additional arg for text-generation-launcher optional | `[]`                                                  |

### Global

| Name                              | Description                                                                                                                         | Value                                           |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `replicaCount`                    | Deployment/StatefulSet replicaCount                                                                                                 | `1`                                             |
| `kind`                            | Resource king [allowed values: deployment/StatefulSet, optional]                                                                    | `deployment`                                    |
| `image.repo`                      | Huggingface image repo [default: ghcr.io/huggingface/text-generation-inference]                                                     | `ghcr.io/huggingface/text-generation-inference` |
| `image.tag`                       | Huggingface image version [default: latest]                                                                                         | `latest`                                        |
| `image.pullPolicy`                | Huggingface image pull policy [default: IfNotPresent] ref: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy | `IfNotPresent`                                  |
| `imagePullSecrets`                | May need if used private repo as a cache for image ghcr.io/huggingface/text-generation-inference                                    | `[]`                                            |
| `nameOverride`                    | String to partially override common.names.name                                                                                      | `""`                                            |
| `fullnameOverride`                | String to fully override common.names.fullname                                                                                      | `""`                                            |
| `persistence.accessModes`         | PVC accessModes                                                                                                                     | `["ReadWriteOnce"]`                             |
| `persistence.storageClassName`    | Kubernetes storageClass name                                                                                                        | `gp2`                                           |
| `persistence.storage`             | Volume size                                                                                                                         | `100Gi`                                         |
| `service.port`                    | Service port, default 8080                                                                                                          | `8080`                                          |
| `service.type`                    | Service type, default ClusterIP                                                                                                     | `ClusterIP`                                     |
| `serviceAccount.create`           | Enable/disable service account, default enabled                                                                                     | `true`                                          |
| `serviceAccount.role`             | Kubernetes role configuration, default nil                                                                                          | `{}`                                            |
| `podAnnotations`                  | Annotations for Redis&reg; replicas pods                                                                                            | `{}`                                            |
| `securityContext`                 | Set pod's Security Context fsGroup                                                                                                  | `{}`                                            |
| `extraEnvVars`                    | Array with extra environment variables to add to main pod                                                                           | `[]`                                            |
| `ingresses.enabled`               | Enable/disable ingress(es) for model API, default disabled                                                                          | `false`                                         |
| `ingresses.configs`               | List of ingresses configs                                                                                                           | `[]`                                            |
| `livenessProbe`                   | Configure extra options for model liveness probe                                                                                    | `{}`                                            |
| `readinessProbe`                  | Configure extra options for model readiness probe                                                                                   | `{}`                                            |
| `startupProbe`                    | Configure extra options for model startup probe                                                                                     | `{}`                                            |
| `pdb.create`                      | Specifies whether a PodDisruptionBudget should be created                                                                           | `false`                                         |
| `pdb.minAvailable`                | Min number of pods that must still be available after the eviction                                                                  | `1`                                             |
| `pdb.maxUnavailable`              | Max number of pods that can be unavailable after the eviction                                                                       | `""`                                            |
| `resources.limits.nvidia.com/gpu` | The required option by text-generation-launcher                                                                                     | `1`                                             |
| `resources.requests.cpu`          | The requested CPU minimal recommended value                                                                                         | `3`                                             |
| `resources.requests.memory`       | The requested memory minimal recommended size                                                                                       | `10Gi`                                          |
| `extraVolumes`                    | Optionally specify extra list of additional volumes for models' pods                                                                | `[]`                                            |
| `extraVolumeMounts`               | Optionally specify extra list of additional volumeMounts for models' container                                                      | `[]`                                            |
| `autoscaling.enabled`             | Enable Horizontal POD autoscaling for model                                                                                         | `true`                                          |
| `autoscaling.minReplicas`         | Minimum number of model replicas                                                                                                    | `1`                                             |
| `autoscaling.maxReplicas`         | Maximum number of model replicas                                                                                                    | `5`                                             |
| `autoscaling.targetCPU`           | Target CPU utilization percentage                                                                                                   | `50`                                            |
| `autoscaling.targetMemory`        | Target Memory utilization percentage                                                                                                | `50`                                            |
| `affinity`                        | Affinity for pod assignment                                                                                                         | `{}`                                            |
| `nodeSelector`                    | Node labels for pod assignment                                                                                                      | `{}`                                            |
| `tolerations`                     | Tolerations for pod assignment                                                                                                      | `[]`                                            |
