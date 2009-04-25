require 'login_management'

use Rack::Session::Cookie
use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = LoginManager
end

run LoginManager