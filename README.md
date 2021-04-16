# platform-tf
Repository for Platform Terraform code

# Under Construction

This environment is still being assembled - at each major milestone (Azure build complete, Agic complete, code deployed) a PR will be raised and the code changes will be merged.

Status: A fully fledged standalone Dynamic environment can be created by branching this code base. This will fully deploy the BC infrastructure, set up the environment and then deploy the Buying Catalogue to it. 

Once the branch above has been merged, the pipeline will deploy the code to the Development environment and once approved onto the Preprod Test environment. 

# Dependencies

This code is dependent on the Platform Terraform Modules repository (https://github.com/nhs-digital-gp-it-futures/platform-tf-modules/) where most of the code has been modularised out to.

# Description

This code base deploys a fully functioning standalone Azure environment with AGIC configured and deploys the GP IT Futures Catalogue to the standalone Kubernetes environment for testing of Environmental changes (e.g. Kubernetes versions) or invasive changes to the application. 

# Goal

The goal is that all Infrastructure changes can be tested and then be propegated into Development -> Test -> Production. 

# Improvements:
1) Cert manually imported into core key vault - needs coding
2) Trigger pipeline on Key Vault change (as per https://stackoverflow.com/questions/61541156/how-to-trigger-a-azure-devops-pipeline-whenever-there-is-azure-keyvault-secret-c)
3) Integrate with webapp
