require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "321864651321651216541641321"
  end


    get "/" do
        erb :welcome
    end

  helpers do
    def logged_in?
      !!session[:user_id]
    end
  end
    
    def current_user
      Trainer.find_by(session[:user_id])
    end

    def authenticate      
      if !logged_in?
        redirect '/login'
      end
    end

  

end
