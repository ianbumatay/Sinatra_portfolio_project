class BullitinsController <ApplicationController  

    get "/bullitins" do  
        if logged_in?
          @bullitins = Bullitin.all 
          erb :"/bullitins/index" 
        else 
            redirect "/login"  
        end
    end  

    # CREATE

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

    # READ

    get "/bullitins/:id" do  
        @bullitin = Bullitin.find_by_id(params[:id]) 

        erb :"/bullitins/show" 
    end 
    
    # UPDATE
    get "/bullitins/:id/edit" do  
        @bullitin = Bullitin.find_by_id(params[:id]) 
         
        if @bullitin.user == current_user
          erb :"/bullitins/edit"  
        else 
            redirect "/bullitins" 
        end
    end 

    patch "/bullitins/:id" do 
        #binding.pry
        @bullitin = Bullitin.find_by_id(params[:id]) 
        if @bullitin.user == current_user
            if @bullitin.update(title: params[:title], content: params[:content]) 
              
              redirect "/bullitins" 
             else 
              erb :"/bullitins/edit"
             end 
        else 
          redirect "/bullitins"
        end
    end   

    # DELETE

    delete "/bullitins/:id" do 
        @bullitin = Bullitin.find_by_id(params[:id]) 
        if @bullitin.user == current_user
           @bullitin.delete  
        end
        redirect "/bullitins"
    end

    



end