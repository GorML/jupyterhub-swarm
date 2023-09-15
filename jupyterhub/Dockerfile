FROM jupyterhub/jupyterhub:latest

RUN python3 -m pip install --no-cache-dir \
    dockerspawner \
    swarmspawner \
	jupyter \
	jupyterhub \
    jupyterhub-nativeauthenticator \
	jupyterhub-dummyauthenticator \
    jupyterhub-idle-culler

# ADD jupyterhub_config.py /srv/jupyterhub/ 
# CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]