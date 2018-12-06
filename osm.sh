case "$1" in
   "install")
      osm nsd-delete hydra_aas_nsd
      osm vnfd-delete hydra_aas_vnfd

      osm vnfd-create hydra_aas_vnf.tar.gz
      osm nsd-create  hydra_aas_ns.tar.gz
   ;;
   "list")
      osm vnfd-list
      osm nsd-list
      osm ns-list
   ;;
   "delete")
      osm nsd-delete hydra_aas_nsd
      osm vnfd-delete hydra_aas_vnfd
   ;;
   "ns-create")
      osm ns-create --ns_name test --nsd_name hydra_aas_nsd --vim_account wins_5g --ssh_keys teste
   ;;
   "ns-delete")
      osm ns-delete test
   ;;
esac


