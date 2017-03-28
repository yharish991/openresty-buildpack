# openresty-buildpack
Run OpenResty on Cloudfoundry with the Lua buildpack.

## How to use
Make sure your project directory to be in the below format 

```
project_root/
 ├ lua-scripts/ # this folder should contain all the lua scripts that are to be used in nginx
  and these scripts will tbe copied to a folder `scripts` under app directory after the application is deployed.
 ├ nginx.conf/ # nginx configuration file
 ├ manifest.yml/ # configuration for the CF App.
```
Make sure to update the `buildpack` attribute of manifest.yml to this repo.

To deploy the application with openresty buildpack use the below command

`cf push -f manifest.yml`


