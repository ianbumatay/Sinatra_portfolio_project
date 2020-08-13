class UserController < ApplicationController   



    
    get "/users/signup" do
        erb :"/users/signup"
    end 

     post "/signup" do
        user = User.create(params)  
      
        redirect :"/bullitins"
     end  


     get "/users/login" do 
        erb :"/users/login" 
     end

     post "/login" do 
        @user = User.find_by(username: params[:username]) 
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/bullitins" 
        else 
            redirect "/users/login" 
        end 
     end 

     get "/logout" do 
        session.clear 

        erb :home
     end

   
end