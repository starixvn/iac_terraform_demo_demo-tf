# get EKS authentication for being able to manage k8s objects from terraform
# deploy spot termination handler
################# haproxy-ingress-controller
resource "helm_release" "haproxy-ingress-controller" {
  name       = "haproxy-ingress-controller"
  namespace  = "haproxy"
  repository = "https://haproxytech.github.io/helm-charts"
  chart      = "kubernetes-ingress"
  version    = "1.33.1"
  # values = [
  #   "${file("values.yaml")}"
  # ]
  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.ingressClass"
    value = "haproxy"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-internal"
    value = "0.0.0.0/0"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
    value = var.lb_az_cross
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-subnets"
    type  = "string"
    value = "${data.terraform_remote_state.vpc.outputs.private_subnets[0]}\\,${data.terraform_remote_state.vpc.outputs.private_subnets[1]}\\,${data.terraform_remote_state.vpc.outputs.private_subnets[2]}"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-name"
    value = lower("${var.team}-${var.environment}-eks-lb")
  }
}

#########
# create all Namespaces into EKS
/*
resource "kubernetes_namespace" "eks_namespaces" {
  for_each = toset(var.namespaces)

  metadata {
    annotations = {
      name = each.key
    }
    name = each.key
  }
}
*/
/*
data "kubernetes_all_namespaces" "allns" {}

resource "kubernetes_namespace" "this" {
  for_each = toset([ for k in var.namespaces : k if !contains(keys(data.kubernetes_all_namespaces.allns), k) ])
  metadata {
    name = each.key
  }
  depends_on = [data.kubernetes_all_namespaces.allns] # potentially more if you want to refresh list of NS
}
*/