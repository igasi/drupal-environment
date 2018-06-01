Project template using composer for Drupal starter kid, managing your site
dependencies with [Composer](https://getcomposer.org/).

## Intallation

Create a project folder and inside it clone this repository:
```
 git clone git@gitlab.com:drupaltitlan/drupal-environment.git
```
Install dependencies:
```
cd drupal-environment
composer install
```

Execute fresh installation scrip:
```
env/dev/freshinstall_dev.sh
```


With `composer require ...` you can download new dependencies to your 
installation.

```
cd some-dir
composer require drupal/devel:~1.0
```
##Installation scripts available
**init.sh** *(env/dev/init.sh)* = this script configure and enables dnsdock container.
**start_dev.sh** *(env/dev/start_dev.sh.sh)* = this commands build and start the containers.
**freshinstall_dev.sh** *(env/dev/freshinstall_dev.sh)* = this commands stop and delete containers, data base, settings files and re-create containers and required files.   

## Project environment definition:
The project consider two environments:

**dev** *(env/dev)*:
This directory will contain dev exported configurations.

**prod** *(env/prod)*
This directory will contain all configurations ready for production.

## Configuration scripts available 
The directory **(drupal-environment)/console/chain** contains a group of yml files with development scripts defined inside.
This scripts help in the development activities like set permissions, export/import configurations or deploy.

To execute any of this commands:

1. Login container: `docker-compose exec www bash`
2. Go to `/web` directory
3. Run the command preceded by: `vendor/bin/drupal `

*example:
    `./../vendor/bin/drupal project:config:export`*
     
###Scripts definition
`project:config:export`:
This command export the configurations.
Script parameters available are for dev or prod environment.

*example:
    ../vendor/bin/drupal project:config:import --environment=dev or live*


