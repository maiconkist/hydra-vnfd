#!/bin/bash

rm *.tar.gz
rm -rf tmp_vnfd

# ----- Build the HYDRA-AAS NFD -------
#mkdir tmp_vnfd
#cp -r hydra_aas_vnfd/* tmp_vnfd
#cd tmp_vnfd
#find * -type f -print | while read line; do md5 $line >> checksums.txt; done
#cd ..
#tar -czvf hydra_aas_vnf.tar.gz tmp_vnfd
#rm -rf tmp_vnfd

# ----- Build the Server NFD -------
mkdir tmp_vnfd
cp -r hydra_server_vnfd/* tmp_vnfd
cd tmp_vnfd
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_server_vnf.tar.gz tmp_vnfd
rm -rf tmp_vnfd

# ----- Build the client NFD -------
mkdir tmp_vnfd
cp -r hydra_client_2tx_2rx_vnfd/* tmp_vnfd
cd tmp_vnfd
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_client_2tx_2rx_vnf.tar.gz tmp_vnfd
rm -rf tmp_vnfd


# ----- Build the RX1 NFD -------
mkdir tmp_vnfd
cp -r hydra_rx1_vnfd/* tmp_vnfd
cd tmp_vnfd
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_rx1_vnf.tar.gz tmp_vnfd
rm -rf tmp_vnfd

# ----- Build the NSD -------
mkdir hydra_aas_ns
cp -r ns/* hydra_aas_ns
cd hydra_aas_ns
find * -type f -print | while read line; do md5 $line >> checksums.txt; done
cd ..
tar -czvf hydra_aas_ns.tar.gz hydra_aas_ns
rm -rf hydra_aas_ns
