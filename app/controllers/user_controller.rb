class UserController < ApplicationController   



    get "/" do
        erb :"users/home"
    end

    get "/users/signup" do

        erb :"/users/signup"
    end 

     post "/signup" do
        user = User.create(params)  
      
        redirect :"/bullitins"
     end

   

 
end