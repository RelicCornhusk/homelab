# Redeployment runbook
## manual steps:
- setup ssh agent
    - ssh-copy-id root@ip-address
- create proxmox cluster
    - cluster name: homelab
    - node name: magi
- map igpu device on proxmox
    - find PCI device for the integrated GPU using lspci
    - map it with the name "iGPU" 
- create terraform api token on proxmox and update its permissions to be admin of root. Paste token to tfvars/HCP Terraform.
- run terraform apply
- make sure the tailscale connector is advertising all routes on Tailscale Admin Console

argocd app create apps \
    --dest-namespace argocd \
    --dest-server https://kubernetes.default.svc \
    --repo https://github.com/RelicCornhusk/homelab.git \
    --path argocd/apps;
