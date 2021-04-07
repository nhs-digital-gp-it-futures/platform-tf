# Listener
az network application-gateway http-listener create -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw --frontend-port gpitfutures-monitor-appgw-feporthttps -n rancher --frontend-ip gpitfutures-monitor-appgw-feip --host-name "rancher.dynamic.buyingcatalogue.digital.nhs.uk" --ssl-cert dyn-buying-catalogue-digital-nhs-uk

# Backend Address Pool
az network application-gateway address-pool create -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw -n rancher

# Probe
az network application-gateway probe create -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw -n rancher --protocol http --host "rancher.dynamic.buyingcatalogue.digital.nhs.uk" --path "/"

# HTTP Setting
az network application-gateway http-settings create -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw -n rancher --port 80 --protocol Http --cookie-based-affinity Disabled --timeout 20 --path "/" --probe "rancher"

# Routing Rule
az network application-gateway rule create -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw -n rancher --http-listener rancher --rule-type Basic --address-pool rancher --http-settings rancher

# Kubernetes Setup
az aks get-credentials -n gpitfutures-monitor-aks -g gpitfutures-monitor-rg-aks --admin

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

kubectl create namespace ingress-appgw

set-location "<path-to-repo>\platform-tf\monitoring\"

kubectl create -f "../ingress/deployment-rbac.yaml"

$aadClientId=$(az identity list --query "[?name=='gpitfutures-monitor-aad-id'].clientId" -o tsv)
$aadIdPath=$(az identity list --query "[?name=='gpitfutures-monitor-aad-id'].id" -o tsv)
$aksSpId=$(az aks list -g gpitfutures-monitor-rg-aks --query "[?name=='gpitfutures-monitor-aks'].servicePrincipalProfile.clientId" -o tsv)
$aksFqdn=$(az aks list -g gpitfutures-monitor-rg-aks --query "[?name=='gpitfutures-monitor-aks'].fqdn" -o tsv)
$appgwRgName=$(az network application-gateway list --query "[?name=='gpitfutures-monitor-appgw'].resourceGroup" -o tsv)
$subId=$(az account list --query "[?name=='GP IT Futures Buying Catalogue'].id" -o tsv --all)

get-content ../ingress/aadpodidentity-template.txt | ForEach-Object {$_.replace("`${name}","gpitfutures-monitor-aad-id")} | ForEach-Object {$_.replace("`${idPath}","$aadIdPath")} | ForEach-Object {$_.replace("`${clientID}","$aadClientId")} > ./scripts/ingress/monitor-aadpodidentity.yaml
get-content ../ingress/aadpodidentitybinding-template.txt | ForEach-Object {$_.replace("`${name}","gpitfutures-monitor-aad-id")} | ForEach-Object {$_.replace("`${clientID}","$aadClientId")} > ./scripts/ingress/monitor-aadpodidentitybinding.yaml

kubectl apply -f ./scripts/ingress/monitor-aadpodidentity.yaml -n ingress-appgw
kubectl apply -f ./scripts/ingress/monitor-aadpodidentitybinding.yaml -n ingress-appgw

az role assignment create --role "Managed Identity Operator" --assignee $aksSpId --scope $aadIdPath

$agicshared="true"
get-content ../ingress/helm-agic-config-template.txt | ForEach-Object {$_.replace("`${subId}","$subId")} | ForEach-Object {$_.replace("`${appgwRg}","$appgwRgName")} | ForEach-Object {$_.replace("`${appgwName}","gpitfutures-monitor-appgw")} | ForEach-Object {$_.replace("`${aadId}","$aadIdPath")} | ForEach-Object {$_.replace("`${clientId}","$aadClientId")} | ForEach-Object {$_.replace("`${apiAddress}","$aksFqdn")} | ForEach-Object {$_.replace("`${shared}","$agicshared")} > ./scripts/ingress/monitor-helm-config.yaml

helm repo add application-gateway-kubernetes-ingress https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/
helm repo update
helm install ingress-azure -f ./scripts/ingress/monitor-helm-config.yaml application-gateway-kubernetes-ingress/ingress-azure -n ingress-appgw --version 1.2.0-rc3
kubectl apply -f https://raw.githubusercontent.com/Azure/application-gateway-kubernetes-ingress/ae695ef9bd05c8b708cedf6ff545595d0b7022dc/crds/AzureIngressProhibitedTarget.yaml

$agicCrdURL="rancher.dynamic.buyingcatalogue.digital.nhs.uk"
$agicCrdName="rancher"
get-content ../ingress/azureingressprohibitedtarget.txt | ForEach-Object {$_.replace("`${PTname}","$agicCrdName")} | ForEach-Object {$_.replace("`${URL}","$agicCrdURL")} > ./scripts/ingress/rancher-monitor-azureingressprohibitedtarget.yaml
kubectl apply -f ./scripts/ingress/rancher-monitor-azureingressprohibitedtarget.yaml -n ingress-appgw

helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo update
kubectl create namespace cattle-system
helm install rancher rancher-stable/rancher --namespace cattle-system --set hostname=rancher.dynamic.buyingcatalogue.digital.nhs.uk --set tls=external

start-sleep 240 # to allow rancher pods to deploy

$ipArr=(kubectl get pods -l app=rancher -n cattle-system -o json | ConvertFrom-Json).items.status.podIp
az network application-gateway address-pool update -g gpitfutures-monitor-rg-appgw --gateway-name gpitfutures-monitor-appgw -n rancher --servers $ipArr  
