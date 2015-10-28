require 'spec_helper'

describe 'carbon_relay_ng', :type => :module do
  let(:facts) { { :osfamily => 'RedHat', :operatingsystem => 'RedHat' } }

  context 'service' do
    context 'default' do
      it { should contain_service('carbon-relay-ng').with(:ensure => 'running', :enable => true) }
    end

    context 'managing service' do
      let(:params) { { :service_ensure => 'stopped', :service_enable => false } }
      it { should contain_service('carbon-relay-ng').with(:ensure => 'stopped', :enable => false ) }
    end
  end
end
