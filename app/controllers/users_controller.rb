class UsersController < ApplicationController
require 'pry'
  get '/signup' do
  #  binding.pry
    if logged_in?

      redirect "/tweets"
    else

      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])

    if @user.save
    #  binding.pry
      session[:user_id] = @user.id
    #  binding.pry
      redirect '/tweets'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect "/tweets"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/tweets"
    else
      redirect to "/login"
    end
  end

end
