- Add the VMs tx, server, rx1, and rx2  IP address to the hosts file.
- **server** is the VM connected to one USRP. This VM will run the HyDRA Server.
- **tx** is the VM implementing the transmitter baseband processing. In this example the baseband processing is a flowgraph that implements //TWO RADIOS//, i.e., VR1 and VR2.
- **rx1** and **rx2** are the receiver. Each one of them needs to be connected to a USRP. **rx1** receives data from VR1 and **rx2** receives data crom VR2.

- Execute the following commands in shell.

ansible-playbook -i hosts ansible_gr_tx1.yml
ansible-playbook -i hosts ansible_gr_server.yml
ansible-playbook -i hosts ansible_gr_rx1.yml

# The last command you execute only if you have two VMs with USRPs for the reception.
ansible-playbook -i hosts ansible_gr_rx2.yml
