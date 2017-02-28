apt_repository 'opennebula' do
  uri "http://downloads.opennebula.org/repo/#{node['opennebula']['version']}/Ubuntu/#{node['lsb']['release']}"
  distribution 'stable'
  components %w(opennebula)
  key 'http://downloads.opennebula.org/repo/Debian/repo.key'
end


