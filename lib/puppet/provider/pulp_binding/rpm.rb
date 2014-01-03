require "#{File.dirname(__FILE__)}/../../../puppet-pulp/pulp_admin"

Puppet::Type::type(:pulp_binding).provide(:rpm) do
  # Only activate this provider if runcible is installed
  confine :feature => :runcible

  def create
    #pulp_admin.bind @resource[:id]
  end

  def destroy
    #pulp_admin.unbind @resource[:id]
  end

  # May want to validate consumer id and repo id separately. As is, this will return false
  # if the consumer id or repo id does not exist as well as if the binding does not exist.
  def exists?
    true if pulp_server.extensions.consumer.retrieve_binding(@resource[:consumer_id], @resource[:id], 'yum_distributor')
  rescue
    false
  end

  private

  def consumer
    #pulp_admin.consumer
  end

  def pulp_server
    @pulp_server ||= Runcible::Instance.new(
      RuncibleHelper.config(@resource[:url], @resource[:login], @resource[:password])
    )
  end
end
