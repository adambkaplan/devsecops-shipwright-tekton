# devsecops-shipwright-tekton

DevSecOps with Shipwright and Tekton

## Getting Started

1. Ensure you have access to an OpenShift cluster, such as CodeReady Containers.
2. Install the Shipwright Operator from OperatorHub. This will also install OpenShift Pipelines.
3. Create the `devsecops-demo` project in your cluster

   ```sh
   $ oc new-project cdcon-demo-ci
   ```

4. Install the `shp` command line.
5. Clone this repository, which contains a sample go application.

   ```sh
   $ mkdir -p ~/go/src/github.com/adambkaplan
   $ cd ~/go/src/github.com/adambkaplan
   $ git clone https://github.com/adambkaplan/devsecops-shipwright-tekton.git
   $ cd devsecops-shipwright-tekton
   ```
### Inner loop development

Run the script at `hack/demo-inner-loop.sh` to see how Shipwright can build from local source,
producing an SBOM for your container image.
If you are not using CodeReadyContainers, use the environment variable `OPENSHIFT_REGISTRY_HOST` to
provide the public route to the OpenShift container registry.
