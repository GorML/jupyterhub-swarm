import os
from dockerspawner import SwarmSpawner

c.JupyterHub.spawner_class = "dockerspawner.SwarmSpawner"
c.SwarmSpawner.image = os.environ["DOCKER_NOTEBOOK_IMAGE"]

c.SwarmSpawner.network_name = os.environ["DOCKER_NETWORK_NAME"]
c.SwarmSpawner.extra_host_config = { 'network_mode': os.environ["DOCKER_NETWORK_NAME"] }
c.Spawner.extra_placement_spec = { "constraints": ["node.role == worker"] }
c.JupyterHub.hub_ip = '0.0.0.0'
c.JupyterHub.port = 8000

# c.JupyterHub.services = [
#    {
#        "name": "cull_idle",
#        "admin": True,
#        # kill idle containers after 1 hour, but do not remove
#        "command": "cull_idle_servers.py --timeout=3600".split(),
#    },
#]


c.JupyterHub.authenticator_class = "nativeauthenticator.NativeAuthenticator"

# Allow anyone to sign-up without approval
c.NativeAuthenticator.open_signup = True


# c.Authenticator.admin_users = {"admin"}
c.SwarmSpawner.notebook_dir = "/home/jovyan"
# c.Spawner.default_url = "/lab" # use JupyterLab (instead of Notebook) by default

c.JupyterHub.admin_access = True

import logging
c.JupyterHub.log_level = logging.DEBUG
c.JupyterHub.debug = True
c.Spawner.debug = True
c.SwarmSpawner.debug = True
