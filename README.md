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

1. Create the Shipwright build strategy and build

   ```sh
   $ oc apply -f .shipwright/
   ```

2. Use the Shipwright command line to build the container image from local source code:

  ```sh
  $ shp buildrun upload devsecops-shipwright-tekton
  ```

This will upload the local source code, build a container image, as well as a software bill of materials (SBOM).
Both the image and SBOM are pushed to the OpenShift internal registry.
