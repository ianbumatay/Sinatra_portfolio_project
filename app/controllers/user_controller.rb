class UserController < ApplicationController   



    
    get "/users/signup" do
        erb :"/users/signup"
    end 

     post "/signup" do
        if params[:username].empty? || params[:email].empty? 
            erb :"/users/signup" 
        else
          user = User.create(params)
          session[:user_id] = user.id
          redirect "/bullitins"
        end
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
            redirect "/login" 
        end 
     end 

     get "/logout" do 
        session.clear 

        erb :home
     end

   
end