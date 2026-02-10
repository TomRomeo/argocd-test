# creating a cluster with kind of the name "test-cluster" with kubernetes version v1.27.1 and two nodes
resource "kind_cluster" "default" {
    name = "test-cluster"
    node_image = "kindest/node:v1.35.0"
    kind_config  {
        kind = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"
        node {
            role = "control-plane"
        }
        node {
            role =  "worker"
        }
        networking {
            disable_default_cni = true
        }
    }
}

resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
    name = "argocd"
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    namespace = kubernetes_namespace_v1.argocd.metadata[0].name
    version = "9.4.1"
    values = []
}