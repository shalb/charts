# Helm chart for deploy Hugging Face to kubernetes cluster. 

See [Hugging Face models](https://huggingface.co/models)

## Parameters

### Model

| Name                        | Description                                                      | Value                                                 |
| --------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------- |
| `model.organization`        | model's company name on huggingface, required!                   | `""`                                                  |
| `model.name`                | model name on huggingface, required!                             | `""`                                                  |
| `init.s3.enabled`           | turn on/off s3 data source Default: disabled                     | `false`                                               |
| `init.s3.bucketURL`         | full s3 URL included path to model's folder                      | `s3://k8s-model-zephyr/llm/deployment/segmind/SSD-1B` |
| `huggingface.containerPort` | optional, default 8080                                           | `8080`                                                |
| `huggingface.args`          | additional arg for text-generation-launcher optional, default [] | `[]`                                                  |

### Global

| Name                              | Description                                                                                                                         | Value                                           |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `replicaCount`                    | default 1                                                                                                                           | `1`                                             |
| `kind`                            | main. Allowed values: deployment/StatefulSet, optional, default: deployment                                                         | `deployment`                                    |
| `image.repo`                      | huggingface image repo [default: ghcr.io/huggingface/text-generation-inference]                                                     | `ghcr.io/huggingface/text-generation-inference` |
| `image.tag`                       | Huggingface image version [default: latest]                                                                                         | `latest`                                        |
| `image.pullPolicy`                | Huggingface image pull policy [default: IfNotPresent] ref: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy | `IfNotPresent`                                  |
| `imagePullSecrets`                | may need if used private repo as a cache for image ghcr.io/huggingface/text-generation-inference                                    | `[]`                                            |
| `nameOverride`                    | String to partially override common.names.name                                                                                      | `""`                                            |
| `fullnameOverride`                | String to fully override common.names.fullname                                                                                      | `""`                                            |
| `persistence.accessModes`         | pvc accessModes, default ["ReadWriteOnce"]                                                                                          | `["ReadWriteOnce"]`                             |
| `persistence.storageClassName`    | k8s storageClass name, default gp2                                                                                                  | `gp2`                                           |
| `persistence.storage`             | volume size, default 100Gi                                                                                                          | `100Gi`                                         |
| `service.port`                    | pvc service port, default 8080                                                                                                      | `8080`                                          |
| `service.type`                    | service type, default ClusterIP                                                                                                     | `ClusterIP`                                     |
| `serviceAccount.create`           | enable/disable service account, default enabled                                                                                     | `true`                                          |
| `serviceAccount.role`             | k8s role configuration, default nil                                                                                                 | `{}`                                            |
| `podAnnotations`                  | Annotations for Redis&reg; replicas pods                                                                                            | `{}`                                            |
| `securityContext`                 | Set pod's Security Context fsGroup                                                                                                  | `{}`                                            |
| `extraEnvVars`                    | Array with extra environment variables to add to main pod                                                                           | `[]`                                            |
| `ingresses.enabled`               | enable/disable ingress(es) for model API, default disabled                                                                          | `false`                                         |
| `ingresses.configs`               | list of ingresses configs                                                                                                           | `[]`                                            |
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
