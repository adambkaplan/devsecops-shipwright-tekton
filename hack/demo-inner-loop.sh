#!/usr/bin/env bash

# shellcheck source=hack/demo-magic/demo-magic.sh
source hack/demo-magic/demo-magic.sh

OPENSHIFT_REGISTRY_HOST=${OPENSHIFT_REGISTRY_HOST:-default-route-openshift-image-registry.apps-crc.testing}

#### Setup ####
kubectl apply -f .shipwright/ko-buildstrategy.yaml
oc new-project cdcon-demo-ci
rm -rf _output
mkdir -p _output
oc registry login

clear

#### Demo ####
p "Here's a simple go application."
ls

wait
clear

p "Let's put it in a container with ko and Shipwright!"
p "First, we need a build strategy that can assemble images with ko."
pe "kubectl get clusterbuildstrategies"

wait
clear

p "Next, we need to tell Shipwright where our code is, and where to push the image."
pe "cat .shipwright/build.yaml"
pe "kubectl apply -f .shipwright/build.yaml"

wait
clear

p "Let's run this build with the shp command line."
pe "shp build run devsecops-shipwright-tekton --follow"

wait
clear

p "Two images are produced - the image and its SBOM."
pe "kubectl get imagestream devsecops-shipwright-tekton -o yaml"

wait
clear

p "We can use cosign to download the SBOM of our image and inspect it."
pe "cosign download sbom --allow-insecure-registry ${OPENSHIFT_REGISTRY_HOST}/cdcon-demo-ci/devsecops-shipwright-tekton:latest > _output/build-git.sbom"
pe "cat _output/build-git.sbom"

wait
clear

p "What if we want to change the message?"
p "We can build our local source code with shp!"
pe "shp build upload devsecops-shipwright-tekton --follow"

wait
clear

p "Note that this produces a different image digest and SBOM!"
pe "kubectl get imagestream devsecops-shipwright-tekton -o yaml"

wait
clear

p "And here's a diff of the SBOMs:"

cosign download sbom --allow-insecure-registry "${OPENSHIFT_REGISTRY_HOST}/cdcon-demo-ci/devsecops-shipwright-tekton:latest" > _output/build-source.sbom 2> /dev/null
diff _output/build-source.sbom _output/build-git.sbom

wait
clear

p "Now we are ready to submit a pull request with our code changes."

#### Teardown ####
clear
oc delete imagestream devsecops-shipwright-tekton
oc delete project cdcon-demo-ci
clear
