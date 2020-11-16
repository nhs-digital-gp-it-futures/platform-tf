# platform-tf
Repository for Platform Terraform code

# Under Construction

This environment is still being assembled - at each major milestone (Azure build complete, Agic complete, code deployed) a PR will be raised and the code changes will be merged.

Status: A fully fledged standalone Dynamic environment can be created by branching this code base. This will fully deploy the BC infrastructure, set up the environment and then deploy the Buying Catalogue to it.  

# Description

This code base deploys a fully functioning standalone Azure environment with AGIC configured and deploys the GP IT Futures Catalogue to the standalone Kubernetes environment for testing of Environmental changes (e.g. Kubernetes versions) or invasive changes to the application. 

# Goal

The goal is that all Infrastructure changes can be tested and then be propegated into Development -> Test -> Production. 

# Improvements:
1) Cert name in z_imported_certs.tf
2) Cert manually imported into core key vault - needs coding
3) Trigger pipeline on Key Vault change (as per https://stackoverflow.com/questions/61541156/how-to-trigger-a-azure-devops-pipeline-whenever-there-is-azure-keyvault-secret-c)
