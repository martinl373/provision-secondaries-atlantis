#!/bin/sh

## Settings (These should come from the k8s manifest or something)
MODULE_REPO_URL="github.com/martinl373/provision-secondaries-terraform.git"
MODULE_REPO_PATH="/novus-runtimes"
MODULE_REPO_REV="main"
RUNTIMES_REPO_PATH="/runtimes"

## Export variables that will be used for template generation
export templates_path="/novus/templates"
export runtimes_path="${DIR}/${RUNTIMES_REPO_PATH}"
export atlantis_config_file="${DIR}/atlantis.yaml"
export terraform_root_file="${DIR}/main.tf"
export terraform_module_source="${MODULE_REPO_URL}/${MODULE_REPO_PATH}?ref=${MODULE_REPO_REV}"

## Generate the root terraform module
gomplate \
    -d runtimes=env:///runtimes_path \
    -d module=env:///terraform_module_source \
    -f ${templates_path}/main.tf.gotmpl \
    -o "${terraform_root_file}"

## Generate the repo root atlantis yaml
gomplate \
    -d runtimes=env:///runtimes_path \
    -d terraform=env:///terraform_root_file \
    -f ${templates_path}/atlantis.yaml.gotmpl \
    -o "${atlantis_config_file}"
