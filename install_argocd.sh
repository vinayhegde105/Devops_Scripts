kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

wget https://github.com/argoproj/argo-cd/releases/download/v2.2.5/argocd-linux-amd64 -O argocd
chmod +x argocd
sudo mv argocd /usr/local/bin
which argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
# kubectl get svc -n argocd
# navigate to portal: username: admin password: obtain from line 8.
