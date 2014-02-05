require 'spec_helper'

describe 'java', :type => :class do

  context "when called with default parameters" do
    it { should create_class('java') }
    it { should contain_package('java-1.7.0-openjdk').with(:ensure => 'latest') }
    it { should contain_file('/etc/profile.d/java.sh').with_mode('0555') }
    it { should_not contain_package('java-1.7.0-openjdk-devel.x86_64') }
  end

  context 'with devel' do
    let(:params) { { :devel => true } }
    it { should contain_package('java-1.7.0-openjdk-devel.x86_64').with(:ensure => 'latest') }
  end

  context 'set version' do
    context 'no devel' do
      let(:params) { { :ensure => '1.2.3' } }
      it { should contain_package('java-1.7.0-openjdk').with(:ensure => '1.2.3') }
      it { should_not contain_package('java-1.7.0-openjdk-devel.x86_64') }
    end

    context 'devel' do
      let(:params) { { :ensure => '1.2.3', :devel => true } }
      it { should contain_package('java-1.7.0-openjdk').with(:ensure => '1.2.3') }
      it { should contain_package('java-1.7.0-openjdk-devel.x86_64').with(:ensure => '1.2.3') }
    end
  end

end

