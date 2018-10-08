from charmhelpers.core.hookenv import (
    action_fail,
    action_get,
    action_set,
    config,
    status_set,
)
from charms.reactive import (
    when,
    set_state,
    remove_state,
)
import charms.sshproxy

cfg = config()


@when('config.changed')
def config_changed():
    err = ''
    try:
        cmd = "echo '' | sudo tee -a /etc/network/interfaces.d/50-cloud-init.cfg > /dev/null && "
        cmd += "echo 'auto ens4' | sudo tee -a /etc/network/interfaces.d/50-cloud-init.cfg > /dev/null && "
        cmd += "echo 'iface ens4 inet dhcp' | sudo tee -a /etc/network/interfaces.d/50-cloud-init.cfg > /dev/null && "
        cmd += "sudo timeout 5 ifup ens4"
        result, err = charms.sshproxy._run(cmd)
    except:
        action_fail('command failed: ' + err)
    else:
        set_state('transcoder.configured')
        status_set('active', 'ready!')


@when('hydra-aas.configured')
@when('actions.start-hydra-aas')
def start_hydra_aas():
    stream_ip = action_get('server-ip')

    err = ''
    try:
        pass
        #result, err = charms.sshproxy._run(cmd)
    except:
        action_fail('command failed: ' + err)
        remove_state('actions.start-hydra-aas')
        return

    err = ''
    try:
       pass
       #result, err = charms.sshproxy._run(cmd)
    except:
        action_fail('command failed: ' + err)
    else:
        action_set({'output': result, 'errors': err})
    finally:
        remove_state('actions.start-transcoder')
