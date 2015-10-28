require 'spec_helper'

describe 'carbon_relay_ng' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "carbon_relay_ng class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('carbon_relay_ng::params') }
          it { is_expected.to contain_class('carbon_relay_ng::install').that_comes_before('carbon_relay_ng::config') }
          it { is_expected.to contain_class('carbon_relay_ng::config') }
          it { is_expected.to contain_class('carbon_relay_ng::service').that_subscribes_to('carbon_relay_ng::config') }

          it { is_expected.to contain_service('carbon-relay-ng') }
          it { is_expected.to contain_package('carbon-relay-ng').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'carbon_relay_ng class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('carbon-relay-ng') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
