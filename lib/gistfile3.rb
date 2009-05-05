class LoginManager < Sinatra::Default
  get "/" do
    view :welcome
  end

  post '/unauthenticated/?' do
    status 401
    view :login
  end

  get '/login/?' do
    view :login
  end
  
  post '/login/?' do
    env['warden'].authenticate!
    redirect "/"
  end
  
  get '/logout/?' do
    env['warden'].logout
    redirect '/'
  end
end