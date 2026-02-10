terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.11.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.1.1"
    }
  }
}

module "cilium" {
  source = "isovalent/cilium/k8s"
  version = "v1.6.8"
  cilium_helm_version = "v1.19.0"
  path_to_kubeconfig_file = kind_cluster.default.kubeconfig_path
  cilium_helm_values_file_path = "./cilium_values.yaml"
  cilium_helm_values_override_file_path = "./cilium_values.yaml"
}

provider "kind" {}

provider "kubernetes" {
  config_path    = kind_cluster.default.kubeconfig_path
}

provider "helm" {
    kubernetes = {
        config_path = kind_cluster.default.kubeconfig_path
    }
}