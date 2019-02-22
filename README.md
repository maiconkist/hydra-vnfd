
## basic_nsd

An example network with TWO slices.
The scenario is as follows:

(figure/hydra_slice_ping_scheme.png)


- From "hydra_client_2tx_2rx" ping  the tap interfaces of "hydra_rx1" and "hydra_rx2" with IPs 1.1.1.2 and 2.2.2.2, respectively.
- From "hydra_rx1" ping the tap0 interface of ""hydra_client_2tx_2rx", IP 1.1.1.1
- From "hydra_rx2" ping the tap1 interface of ""hydra_client_2tx_2rx", IP 2.2.2.1


## Troubleshooting


In machine "hydra-server" exec (replace 192.168.5.54 by the ip of iris2):

```
python ~/gr-hydra/grc_blocks/app/ansible_hydra_gr_server.py --ansibleIPPort 192.168.5.54:5000
```

In machine "hydra_client_2tx_2rx" exec (replace 192.168.5.82 by the IP of iris2):
```
python ~/gr-hydra/grc_blocks/app/ansible_hydra_gr_client_2tx_2rx.py --ansibleIP 192.168.5.82
```


In machine "hydra_rx1" exec:
```
python ~/gr-hydra/grc_blocks/app/ansible_hydra_vr1_rx.py
```

In machine "hydra_rx2" exec:
```
python ~/gr-hydra/grc_blocks/app/ansible_hydra_vr2_rx.py
```



Ping latency in all cases should be around 120ms, without loses.

This scenario represents a case with 2 slices (in this case we dont have any performance difference between them). The attached PDF gives represents what is each machine (VM) and how they are connected.
