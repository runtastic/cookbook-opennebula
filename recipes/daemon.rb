include_recipe 'opennebula'

package 'opennebula'

# config files that have to be written
configfiles = ["oned.conf","sched.conf","tmrc","defaultrc","az_driver.conf","az_driver.default","ec2_driver.conf","ec2_driver.default"]

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

service 'opennebula' do
  action [ :enable, :start ]
end
