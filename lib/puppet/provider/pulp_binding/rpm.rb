Puppet::Type::type(:pulp_binding).provide(:rpm) do
  # Only activate this provider if runcible is installed
  confine :feature => :runcible

  def create
    pulp_admin.bind @resource[:id]
  end

  def destroy
    #pulp_admin.unbind @resource[:id]
  end

  def exists?
    !consumer.nil? && consumer.consumer_id == @resource[:id]
  end

  private

  def consumer
    pulp_admin.consumer
  end

  def pulp_admin
    PuppetPulp::PulpAdmin.new @resource[:login], @resource[:password]
  end
end
