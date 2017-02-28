include_recipe "opennebula"

# due to dependency / package issues with the ubuntu opennebula packages, sunstone needs a daemon installation
include_recipe "opennebula::daemon"


package "opennebula-sunstone" 

configfiles = ["sunstone-server.conf"]

configfiles.each do |filename|
  template "/etc/one/#{filename}" do
    source 'generic.conf.erb'
    group 'root'
    owner 'root'
    mode '644'
    variables :config => node['opennebula']['config'][filename]
    helpers(GenericConfig)
    only_if {node['opennebula']['config'].attribute?(filename)}
  end
end

service 'opennebula-sunstone' do
  action [ :enable, :start ]
end
