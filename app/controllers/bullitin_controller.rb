class BullitinController <ApplicationController  

    get "/bullitins" do  
        if logged_in?
          @bullitins = Bullitin.all 
          erb :"/bullitins/index" 
        else 
            redirect "/login"  
        end
    end 

    get "/bullitins/new" do 
        erb :"/bullitins/new" 
    end 

    post "/bullitins" do  
         @bullitin = current_user.bullitins.build(params)
         if @bullitin.save
           redirect "/bullitins" 
         else 
           erb :"/bullitins/new" 
         end
    end 

    get "/bullitins/:id" do  
        @bullitin = Bullitin.find(params[:id]) 

        erb :"/bullitins/show" 
    end 
    
    get "/bullitins/:id/edit" do  
        @bullitin = Bullitin.find(params[:id]) 
         
        if @bullitin.user == current_user
          erb :"/bullitins/edit"  
        else 
            redirect "/bullitins" 
        end
    end 

    patch "/bullitins/:id" do 
        #binding.pry
        bullitin = Bullitin.find(params[:id])
        bullitin.update(title: params[:title], content: params[:content])

        redirect "/bullitins"
    end  

    delete "/bullitins/:id" do 
        bullitin = Bullitin.find(params[:id]) 
        bullitin.delete  

        redirect "/bullitins"
    end

    



end