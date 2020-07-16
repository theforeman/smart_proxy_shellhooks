module Proxy::ShellHooks
  #class NotFound < RuntimeError; end

  class Plugin < ::Proxy::Plugin
    plugin 'shellhooks', Proxy::ShellHooks::VERSION

    default_settings :directory => '/var/lib/foreman/shellhooks'

    http_rackup_path File.expand_path('shellhooks_http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('shellhooks_http_config.ru', File.expand_path('../', __FILE__))
  end
end
