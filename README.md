opennebula Cookbook
===================
This chef cookbook installs and configures Opennebula

Requirements
------------

#### Operating systems
-  Ubuntu 16.04
-  Ubuntu 14.04

Attributes
----------

The attributes under config represent the Opennebula config files. 
The default attributes in the file represent the configs that are shipped with the packages from http://downloads.opennebula.org

For more information about how to configure Opennebula check the docs: http://docs.opennebula.org/5.2/ or the attributes files in the cookbook (containing the original comments from the config files)

There are some attributes to control the general installation
#### opennebula::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td>['opennebula']['version']</td>
    <td>String</td>
    <td>Opennebula version that will be installed (repository to be used)</td>
    <td><tt>5.2</tt></td>
  </tr>
</table>

Usage
-----
#### opennebula::default
Installs opennebula-common package that is needed on most machines in an Opennebula environment.
The package will create the oneadmin user with id 9869 and the home directory in ```/var/lib/one```

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[opennebula]"
  ]
}
```

#### opennebula::repository
Adds the original Ubuntu repository from http://downloads.opennebula.org for the version specified in the ```['opennebula']['version']``` attribute.
The recipe is included in several other recipes and will not be needed directly in most cases.

#### opennebula::daemon
Will install the Opennebula daemon (oned and scheduler) package.

**Be aware that you have to set all options you want to appear in that file.** See the roles file under ```test/integration/roles/opennebula-server.json ``` as example

#### opennebula::dependencies
Installs dependencies instead of issuing ```/usr/share/one/install_gems```. It is here for completeness, cause the original script needs user interaction.

#### opennebula::node
This recipe prepares an Opennebula node (aka the Hypervisor / KVM)

#### opennebula::sunstone
This recipe installs sunstone package. 

License and Authors
-------------------
Authors: 
- Armin Deliomini, Runtastic - armin.deliomini@runtastic.com

License: MIT
