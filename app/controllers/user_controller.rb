class UserController < ApplicationController   



    get "/" do
        erb :"users/home"
    end

   get "/users/signup" do
     erb :"/users/signup" 
   end 

   post "/signup" do  
     
      if params[:username] == "" || params[:password_digest] == ""
        erb :"/users/home" 
      else
        user = User.create(params)
        session[user_id] = @user.id
        redirect "/bullitins" 
      end
   end  
   
   


   get "/users/login" do 
    erb :"/users/login" 
   end
   
   post "/login" do  
    #binding.pry
     @user = User.find_by(username: params[:username],
                       password_digest: params[:password_digest])  
      if @user 
        session[:user_id] = @user.id 
        redirect "/bullitins" 
      else 
        redirect "/users/login" 
      end
   end











   get "/users/home" do 
   # @user = User.find(session[:user_id]) 

    erb :"/users/home" 
   end
 
end