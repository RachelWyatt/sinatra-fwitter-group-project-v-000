require './config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end


    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

end
