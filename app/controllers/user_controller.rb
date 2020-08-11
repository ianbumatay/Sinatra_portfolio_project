class UserController < ApplicationController   



    get "/" do
        erb :"users/home"
    end

   get "/users/signup" do
     erb :"/users/signup" 
   end 

   post "/users" do  
    #binding.pry 
    @user = User.new(username: params[:username], 
                        email: params[:email], 
                     password: params[:password]) 
     @user.save  

     redirect "/users/home"
   end 









   get "/users/home" do 
   # @user = User.find(session[:user_id]) 

    erb :"/users/home" 
   end
 
end