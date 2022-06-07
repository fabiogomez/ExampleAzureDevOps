#!/bin/bash

ResourceGroup="rg-fabiogomeztraining"
resources="$(az resource list --resource-group $ResourceGroup | grep id | awk -F \" '{print $4}')"

for id in $resources; do
    #az resource delete --resource-group $ResourceGroup --ids "$id" --verbose
    echo $id
done
