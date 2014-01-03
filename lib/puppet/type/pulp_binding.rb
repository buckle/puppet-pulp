require 'puppet/type'
require 'uri'

Puppet::Type.newtype(:pulp_binding) do
  ensurable

  newparam(:id) do
    desc 'Bind the consumer to this repo id'
    isnamevar
    validate do |v|
      raise 'id may contain only alphanumberic, ., -, and _' unless v =~ /^[A-Za-z0-9\.\-_]+$/
    end
  end

  newparam(:url)
  newparam(:login)
  newparam(:password)

  validate do
    fail 'must specify url' if self[:url].to_s.empty?
    fail 'must specify login' if self[:login].to_s.empty?
    fail 'must specify password' if self[:password].to_s.empty?
  end
end
