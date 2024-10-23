# Project Overview

This repository demonstrates a CI/CD pipeline for building, testing, and deploying a simple Go application using GitHub Actions. The aim is to show how GitHub Actions can push Docker images to GitHub Container Registry (GHCR) and Docker Hub, with future deployment to environments managed by Octopus Deploy.

## Challenges Encountered:
1. **Octopus Self-Hosted**:  
   - Could not configure MySQL within the Helm startup script for Octopus Deploy. Further debugging would be needed.
   
2. **Azure AKS**:  
   - The free tier lacked sufficient VM quotas to spin up a Kubernetes cluster.

3. **Kustomize Integration**:  
   - Using `kustomization.yaml` with overlays (development, production, staging) wasn't functioning as expected when paths like `k8s/overlays` were used.

4. **GitHub Container Registry (GHCR)**:  
   - Successfully pushed images to GHCR, but figuring out the OCI library feed configuration and setting up image-triggered releases in Octopus is still in progress.

## Goal

The objective is to set up a build pipeline using GitHub Actions and integrate it with Octopus Deploy. The pipeline will:
- Build and test the Go application.
- Push Docker images to both GHCR and Docker Hub.
- Ideally, Octopus Deploy will trigger and deploy releases to the required environments whenever an image or tag is updated.

## Future Steps

1. **Multi-Tenancy**:  
   - Explore how to handle multi-tenancy setups effectively in Octopus Deploy and Kubernetes. Separate configurations per tenant and environment with appropriate access controls for each.

2. **Variable Substitution**:  
   - Enhance usage of project variables across environments in Octopus Deploy, allowing greater flexibility in managing environment-specific values. Explore further variable substitution mechanisms within both Kustomize and Octopus.

3. **Secrets Management**:  
   - Integrate secure secrets management with solutions like HashiCorp Vault or Kubernetes Secrets. Automate the injection of secrets into deployment pipelines and ensure these are handled securely.

4. **Sync and State Management**:  
   - Look into implementing sync mechanisms between Octopus Deploy and GitHub (or other SCM tools) to ensure configuration drift is minimized, and that deployments stay consistent with the latest code.

5. **Feed Triggering Mechanisms**:  
   - Investigate and implement feed-triggering mechanisms in Octopus that watch for new container images or Helm charts from GHCR, Docker Hub, or OCI feeds, automatically triggering the release pipelines.

6. **Branch Triggering Mechanisms**:  
   - Set up a more robust branching strategy for triggering deployments based on specific branches or tags. Automate branching logic for features, releases, and hotfixes using GitHub Actions and Octopus.

7. **Project Variable Usage**:  
   - Utilize project-level variables more extensively in Octopus Deploy, making it easier to manage settings across multiple environments, tenants, and releases.

8. **Progressive Delivery**:  
   - Look into advanced progressive delivery mechanisms like canary releases and blue-green deployments. Automate these processes using Octopus Deploy’s lifecycle features and ensure they can be triggered through GitHub Actions.
