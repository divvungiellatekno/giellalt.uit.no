# gtlabcontainerregistry.azurecr.io

Many of our services are run as podman containers on our servers. We build the
images on our local machines, and push up images to a _container registry_,
which is hosted in Azure Container Registries. The address is

```
gtlabcontainerregistry.azurecr.io
```

(_cr_ is a common abbreviation for _container registry_).


## Login

To be able to push and pull images to the registry, podman must first be logged
into it. Run the following to log in:

```
podman login gtlabcontainerregistry.azurecr.io
```

You will be prompted for the username, which is the same as the name of the
container registry, namely `gtlabcontainerregistry`, and then you will be
prompted for the password. The password can be found on the Azure Portal.
