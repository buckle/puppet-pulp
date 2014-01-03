module PuppetPulp
  class RuncibleHelper
    def self.config(url, login, password)
      {
        :url        => url,
        :user       => login,
        :http_auth  => { :password => password },
      }
    end
  end
end
