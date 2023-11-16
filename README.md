# The SHALB Helm Library

Here we collect useful charts we designed in [SHALB](https://shalb.com) also used in our [cluster.dev](htts://cluster.dev) product for building cloud installers and creating infrastructure templates with Terraform modules and Helm charts.

## Before you begin

### Prerequisites

- Kubernetes 1.23+
- Helm 3.8.0+

## Setup a Kubernetes Cluster

The quickest way to setup a Kubernetes cluster in different clouds to install SHALB Charts is by using [cluster.dev](https://docs.cluster.dev).

## Bootstrapping Kubernetes in Different Clouds

Create fully featured Kubernetes clusters with required addons:

| Cloud Provider | Kubernetes Type | Sample Link             | Technologies       |
|----------------|-----------------|-------------------------|------------------|
| AWS            | EKS             | [**AWS-EKS**](https://docs.cluster.dev/examples-aws-eks/)            | <img src="https://docs.cluster.dev/images/AWS.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/Kubernetes.png" width="50" height="50"> |
| AWS            | K3s             | [**AWS-K3s**](https://docs.cluster.dev/examples-aws-k3s/)            | <img src="https://docs.cluster.dev/images/AWS.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/K3s.png" width="50" height="50"> |
| GCP            | GKE             | [**GCP-GKE**](https://docs.cluster.dev/examples-gcp-gke/)            | <img src="https://docs.cluster.dev/images/Google Cloud Platform.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/Kubernetes.png" width="50" height="50"> |
| AWS            | K3s + Prometheus| [**AWS-K3s Prometheus**](https://docs.cluster.dev/examples-aws-k3s-prometheus/) | <img src="https://docs.cluster.dev/images/AWS.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/K3s.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/Prometheus.png" width="50" height="50"> |
| DO             | K8s             | [**DO-K8s**](https://docs.cluster.dev/examples-do-k8s/)             | <img src="https://docs.cluster.dev/images/Digital Ocean.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/Kubernetes.png" width="50" height="50"> |

## Using Helm

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the helm binary is in the PATH of your shell.
Once you have installed the Helm client, you can deploy a SHALB Helm Chart into a Kubernetes cluster.
Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/).

## Using Helm with cluster.dev

Example of how to deploy application with Helm and Terraform to Kubernetes:

| Description                 | Sample Link                           | Technologies       |
|-----------------------------|---------------------------------------|------------------|
| Kubernetes Terraform Helm | [**Quick Start with Kubernetes**](https://docs.cluster.dev/get-started-cdev-helm/)    | <img src="https://docs.cluster.dev/images/Kubernetes.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/terraform.png" width="50" height="50"> <img src="https://docs.cluster.dev/images/HELM.png" width="50" height="50"> |

## License

Copyright © 2023 SHALB.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0