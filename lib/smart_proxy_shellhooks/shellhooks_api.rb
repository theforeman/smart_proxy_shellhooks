require 'sinatra'
require 'smart_proxy_shellhooks/shellhooks'

module Proxy::ShellHooks
  VALID_SHELL = Regexp.compile(/[a-z0-9_-]+/)

  class Api < ::Sinatra::Base
    include ::Proxy::Log
    helpers ::Proxy::Helpers

    get '/' do
      executable = []
      other = []
      Dir.each_child(Plugin.settings.directory) do |filename|
        file = File.join(Plugin.settings.directory, filename)
        if valid_shell?(file)
          executable.append(filename)
        else
          other.append(filename)
        end
      end
      {valid: executable, invalid: other}.to_json
    end

    private

    def valid_shell?(file)
      File.executable_real?(file) && File.file?(file) && file =~ VALID_SHELL
    end
  end
end
