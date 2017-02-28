# install apt dependencies
packages=%w{rake libxml2-dev libxslt1-dev libsqlite3-dev libcurl4-openssl-dev libmysqlclient-dev ruby-dev }
package packages do
  action :install
end

# install gem dependencies
gems=%w{aws-sdk nokogiri json rack sinatra thin zendesk_api sqlite3 sequel amazon-ec2 uuidtools curb net-ldap builder trollop treetop parse-cron ox mysql softlayer_api configparser azure }

gems.each do |gem|
  gem_package gem do 
    action :install
  end
end
