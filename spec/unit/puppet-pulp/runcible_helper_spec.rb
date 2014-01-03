require 'spec_helper'
#require 'rspec/mocks'
require 'puppet-pulp/runcible_helper'

describe PuppetPulp::RuncibleHelper do
  describe '.config' do
    subject{ PuppetPulp::RuncibleHelper.config(url, login, password) }

    let(:url) { 'https://pulp.example.com' }
    let(:login) { 'test-login' }
    let(:password) { 'test-password' }

    context 'with a valid url, login and password' do
      it { should be_instance_of Hash }
      it { should == {:url => url, :user => login, :http_auth => { :password => password } } }
    end
  end
end