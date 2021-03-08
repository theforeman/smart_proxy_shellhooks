module Proxy::ShellHooks
  class Plugin < ::Proxy::Plugin
    plugin 'shellhooks', Proxy::ShellHooks::VERSION

    default_settings :directory => '/var/lib/foreman/shellhooks'

    # Listening via HTTP is only good for development
    if ENV["FOREMAN_SHELLHOOKS_HTTP"]
      http_rackup_path File.expand_path('shellhooks_http_config.ru', File.expand_path('../', __FILE__))
    end
    https_rackup_path File.expand_path('shellhooks_http_config.ru', File.expand_path('../', __FILE__))
  end
end
