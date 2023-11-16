# Helm chart for deploy HuggingFace models to Kubernetes cluster

Charts install [Text Generation Inference](https://github.com/huggingface/text-generation-inference) container and serves [Text Generation LLM models](https://huggingface.co/models?pipeline_tag=text-generation).
It is possible to inject another image to serve inference with different approach.

init-container is used to download model to PVC storage from HuggingFace directly or from s3-compatible(and from other storage).

Also it would deploy [HuggingFace chat-ui](https://github.com/huggingface/chat-ui) image and configure it to use with deployed model to be able to chat with it in browser.

## Parameters

### Model

| Name                        | Description                                          | Value                                                               |
| --------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------- |
| `model.organization`        | Models' company name on huggingface, required!       | `""`                                                                |
| `model.name`                | Models' name on huggingface, required!               | `""`                                                                |
| `init.s3.enabled`           | Turn on/off s3 data source Default: disabled         | `false`                                                             |
| `init.s3.bucketURL`         | Full s3 URL included path to model's folder          | `s3://k8s-model-zephyr/llm/deployment/HuggingFaceH4/zephyr-7b-beta` |
| `huggingface.containerPort` | Deployment/StatefulSet ContainerPort, optional       | `8080`                                                              |
| `huggingface.args`          | Additional arg for text-generation-launcher optional | `[]`                                                                |

### Global

| Name                              | Description                                                                                                                                   | Value                                           |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| `replicaCount`                    | Deployment/StatefulSet replicaCount                                                                                                           | `1`                                             |
| `kind`                            | Resource king [allowed values: Deployment/StatefulSet, optional]                                                                              | `Deployment`                                    |
| `image.repo`                      | Huggingface image repo                                                                                                                        | `ghcr.io/huggingface/text-generation-inference` |
| `image.tag`                       | Huggingface image version                                                                                                                     | `latest`                                        |
| `image.pullPolicy`                | Huggingface image pull policy                                                                                                                 | `IfNotPresent`                                  |
| `imagePullSecrets`                | May need if used private repo as a cache for image ghcr.io/huggingface/text-generation-inference                                              | `[]`                                            |
| `nameOverride`                    | String to partially override common.names.name                                                                                                | `""`                                            |
| `fullnameOverride`                | String to fully override common.names.fullname                                                                                                | `""`                                            |
| `shmVolume.enabled`               | Enable emptyDir volume for /dev/shm for model pod(s)                                                                                          | `true`                                          |
| `shmVolume.sizeLimit`             | Set this to enable a size limit on the shm tmpfs                                                                                              | `1Gi`                                           |
| `persistence.accessModes`         | PVC accessModes                                                                                                                               | `["ReadWriteOnce"]`                             |
| `persistence.storageClassName`    | Kubernetes storageClass name                                                                                                                  | `gp2`                                           |
| `persistence.storage`             | Volume size                                                                                                                                   | `100Gi`                                         |
| `service.port`                    | Service port, default 8080                                                                                                                    | `8080`                                          |
| `service.type`                    | Service type, default ClusterIP                                                                                                               | `ClusterIP`                                     |
| `serviceAccount.create`           | Enable/disable service account, default enabled                                                                                               | `true`                                          |
| `serviceAccount.role`             | Kubernetes role configuration, default nil                                                                                                    | `{}`                                            |
| `podAnnotations`                  | Annotations for replicas pods                                                                                                                 | `{}`                                            |
| `updateStrategy`                  | specifies the strategy used to replace old Pods by new ones. Can be set to `RollingUpdate`, `OnDelete` (StatefulSet), `Recreate` (Deployment) | `{}`                                            |
| `securityContext`                 | Set pod's Security Context fsGroup                                                                                                            | `{}`                                            |
| `extraEnvVars`                    | Array with extra environment variables to add to main pod                                                                                     | `[]`                                            |
| `ingresses.enabled`               | Enable/disable ingress(es) for model API, default disabled                                                                                    | `false`                                         |
| `ingresses.configs`               | List of ingresses configs                                                                                                                     | `[]`                                            |
| `livenessProbe`                   | Configure extra options for model liveness probe                                                                                              | `{}`                                            |
| `readinessProbe`                  | Configure extra options for model readiness probe                                                                                             | `{}`                                            |
| `startupProbe`                    | Configure extra options for model startup probe                                                                                               | `{}`                                            |
| `pdb.create`                      | Specifies whether a PodDisruptionBudget should be created                                                                                     | `false`                                         |
| `pdb.minAvailable`                | Min number of pods that must still be available after the eviction                                                                            | `1`                                             |
| `pdb.maxUnavailable`              | Max number of pods that can be unavailable after the eviction                                                                                 | `""`                                            |
| `resources.limits.nvidia.com/gpu` | The required option by text-generation-launcher                                                                                               | `1`                                             |
| `resources.requests.cpu`          | The requested CPU minimal recommended value                                                                                                   | `3`                                             |
| `resources.requests.memory`       | The requested memory minimal recommended size                                                                                                 | `10Gi`                                          |
| `extraVolumes`                    | Optionally specify extra list of additional volumes for models' pods                                                                          | `[]`                                            |
| `extraVolumeMounts`               | Optionally specify extra list of additional volumeMounts for models' container                                                                | `[]`                                            |
| `autoscaling.enabled`             | Enable Horizontal POD autoscaling for model                                                                                                   | `true`                                          |
| `autoscaling.minReplicas`         | Minimum number of model replicas                                                                                                              | `1`                                             |
| `autoscaling.maxReplicas`         | Maximum number of model replicas                                                                                                              | `5`                                             |
| `autoscaling.targetCPU`           | Target CPU utilization percentage                                                                                                             | `50`                                            |
| `autoscaling.targetMemory`        | Target Memory utilization percentage                                                                                                          | `50`                                            |
| `affinity`                        | Affinity for pod assignment                                                                                                                   | `{}`                                            |
| `nodeSelector`                    | Node labels for pod assignment                                                                                                                | `{}`                                            |
| `tolerations`                     | Tolerations for pod assignment                                                                                                                | `[]`                                            |
