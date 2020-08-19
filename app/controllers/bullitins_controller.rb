class BullitinsController <ApplicationController  

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
      get_bullitin

      erb :"/bullitins/show" 
    end 
    
    get "/bullitins/:id/edit" do   
       get_bullitin
       if @bullitin.user == current_user
         erb :"/bullitins/edit"  
       else 
         redirect "/bullitins" 
       end
    end 

    patch "/bullitins/:id" do 
      get_bullitin   
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

    delete "/bullitins/:id" do 
       get_bullitin 
        if @bullitin.user == current_user
           @bullitin.delete  
        end
        redirect "/bullitins"
    end 

    private 

    def get_bullitin 
      @bullitin = Bullitin.find_by_id(params[:id]) 
    end

end