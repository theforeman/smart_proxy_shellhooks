require 'smart_proxy_shellhooks/shellhooks_api'

map '/shellhook' do
  run Proxy::ShellHooks::Api
end
