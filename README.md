## Project structure
drupal-environment *(root)*

  |── config                  # Drupal configuration files exported by environment  
  ├   ├── dev                   # Config files for dev environment  
  ├   └── prod                  # Config files for production  
  ├── console                 # Scripts executables via drupal console  
  ├   ├── cache                 #  
  ├   ├── chain                 # Custom chain scripts for development   
  ├   └──  sites                 #  
  ├── drush                   # Commands, configuration and site aliases for Drush  
  ├── env                     # Scripts and files related by environment  
  ├   ├── dev                   #   
  ├   └── prod                  #  
  ├── scripts                 # Automated tests (alternatively `spec` or `tests`)  
  └── web                     # Drupal files directory  

Project template using composer for Drupal starter kid, managing your site
dependencies with [Composer](https://getcomposer.org/).


## Initialization

Go to the project folder and clone the drupal environment repository:
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
After the execution of fresh install command your drupal instance must be ready,
to verify go to:
`http://www.project.vm/`

## Project personalization

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
This directory will contain the configuration files and scripts for development

**prod** *(env/prod)*
This directory will contain the configuration files and scripts for deploy

## Configuration scripts available 
The directory **(drupal-environment)/console/chain** contains a group of yml files with development scripts defined inside.

This scripts help in the development activities like set permissions, export/import configurations or deploy.  
To execute any of this commands:

1. Login container: `docker-compose exec www bash`
2. Go to `/web` directory
3. Run the command preceded by: `./../vendor/bin/drupal `

*example:
    `./../vendor/bin/drupal project:config:export`*
     
## Command Script definition

`project:config:export`
This command export the active configurations in the environment defined.
Script parameters available are for dev or prod environment, the environment ins defined at the end of the command.

*example:
    ../vendor/bin/drupal project:config:import --environment=dev or prod*

`project:config:import`
This command import the active configurations in the environment defined.
Script parameters available are for dev or prod environment, the environment ins defined at the end of the command.

*example:
    ../vendor/bin/drupal project:config:import --environment=prod or dev*

`project:config:set:ownership`
This command set owner 1000 to **config** directory.

*example:
    ../vendor/bin/drupal project:config:set:ownership*

`project:debug:errors`
This command show httpd log and errors.

*example:
    ../vendor/bin/drupal project:debug:errors*
    
`project:deploy`
This command Deploy to environment (dev|live) with latest changes on master branch.
Script parameters available are for dev or prod environment, the environment ins defined at the end of the command.

*example:
    ../vendor/bin/drupal project:deploy --to=dev*
    
`project:file:set:ownership`
This command set the ownership to files folder.

*example:
    ../vendor/bin/drupal project:file:set:ownership*
    
`project:modules:set:ownership`
This command set the ownership to modules folder.

*example:
    ../vendor/bin/drupal project:modules:set:ownership*
    
## WORKFLOW
   
Development work will take place (mostly) in **WEB** directory:
 
 web *(drupal files)*   
  ├── modules                   # Directory for contrib and custom modules   
  ├── profiles                  # Custom install configurations  
  ├── sites                     # Here comes anything which is not part of the Drupal core  
  ├── themes                    # Custom or contrib themes  



