require 'spec_helper'


describe package('opennebula') do
  major_version = MetaData.version[0..2]
  it { should be_installed.with_version(MetaData.version) }
end

describe service('opennebula') do
  it { should be_enabled }
  it { should be_running }
end

describe user('oneadmin') do
  it { should exist }
  it { should have_uid 9869 }
  it { should have_home_directory '/var/lib/one' }
end
