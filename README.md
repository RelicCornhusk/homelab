manual steps:
- setup ssh agent
- create proxmox cluster
- map igpu device on proxmox
- create api token and update its permissions to be admin of root. Paste token to auto.tfvars
- get and delete initial admin secret for argocd. Rotate password.


argocd app create apps \
    --dest-namespace argocd \
    --dest-server https://kubernetes.default.svc \
    --repo https://github.com/RelicCornhusk/homelab.git \
    --path argocd/apps;
