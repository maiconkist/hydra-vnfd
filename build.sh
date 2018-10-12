#!/bin/bash

rm *.tar.gz

# ----- Build the NFD -------
mkdir hydra_aas_vnf
cp -r vnf/* hydra_aas_vnf
#cp -r charms hydra_aas_vnf
cd hydra_aas_vnf
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_aas_vnf.tar.gz hydra_aas_vnf
rm -rf hydra_aas_vnf


# ----- Build the NSD -------
mkdir hydra_aas_ns
cp -r ns/* hydra_aas_ns
cd hydra_aas_ns
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_aas_ns.tar.gz hydra_aas_ns
rm -rf hydra_aas_ns
