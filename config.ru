pwd = File.dirname(__FILE__)

$:.unshift "#{pwd}/vendor/sinatra/lib"
require 'sinatra'

$:.unshift "#{pwd}/vendor/warden/lib"
require 'warden'


##                
$:.unshift "#{pwd}/lib"
require 'warden_strategies'
require 'login_app'
require 'blog_app'
   

##
use Rack::Session::Cookie
use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = LoginManager
end

map "/blog" do
  run Blog
end

map "/" do
  run LoginManager  
end
