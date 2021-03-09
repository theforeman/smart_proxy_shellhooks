module Proxy::ShellHooks
  #class NotFound < RuntimeError; end

  class Plugin < ::Proxy::Plugin
    plugin 'shellhooks', Proxy::ShellHooks::VERSION

    default_settings :directory => '/var/lib/foreman/shellhooks'

    rackup_path File.expand_path('shellhooks_http_config.ru', __dir__)
  end
end
