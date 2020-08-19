class UsersController < ApplicationController   

    
     get "/users/signup" do
       erb :"/users/signup"
     end 

     post "/signup" do
       if params[:username].empty? || params[:email].empty? || params[:password].empty?
          flash[:error] = "please fill the required fields"
          redirect "/users/signup"  
       else
          user = User.create(params)
          session[:user_id] = user.id
          redirect "/bulletins"
       end
     end  

     get "/users/login" do 
       erb :"/users/login" 
     end

     post "/login" do 
       @user = User.find_by(username: params[:username]) 
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/bulletins" 
        else 
          flash[:error] = "Invalid credentials. please try again"
          redirect "/users/login" 
        end 
     end 

     get "/logout" do 
       session.clear 

        erb :home
     end
end 