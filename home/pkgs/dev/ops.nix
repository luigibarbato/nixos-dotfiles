{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli
    azure-cli
    kubectl
    kubectx
    kubernetes-helm
    kustomize
    krew
    minikube
    kind
    docker
    docker-compose
    git
    openvpn
  ];
}
