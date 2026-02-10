output "kubernetes_name" {
    value = kind_cluster.default.name
    description = "The name of the Kubernetes cluster created by kind"
}

output "kubernetes_kubeconfig" {
    value = kind_cluster.default.kubeconfig
    description = "The kubeconfig file content for the Kubernetes cluster created by kind"
    sensitive = true
}