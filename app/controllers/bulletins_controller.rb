class BulletinsController <ApplicationController  

    get "/bulletins" do  
      if logged_in?
        @bulletins = Bulletin.all 
          erb :"/bulletins/index" 
       else 
          redirect "/login"  
       end
     end  

    get "/bulletins/new" do 
        erb :"/bulletins/new" 
    end 

    post "/bulletins" do  
      @bulletin = current_user.bulletins.build(params)
        if @bulletin.save
          redirect "/bulletins" 
        else 
          erb :"/bulletins/new" 
        end
     end  

    get "/bulletins/:id" do 
      get_bulletin

      erb :"/bulletins/show" 
    end 
    
    get "/bulletins/:id/edit" do   
       get_bulletin
       if @bulletin.user == current_user
         erb :"/bulletins/edit"  
       else 
         redirect "/bulletins" 
       end
    end 

    patch "/bulletins/:id" do 
      get_bulletin   
      if @bulletin.user == current_user
         if @bulletin.update(title: params[:title], content: params[:content])  
           redirect "/bulletins" 
          else 
           erb :"/bulletins/edit"
          end 
      else 
        redirect "/bulletins"
      end
    end   

    delete "/bulletins/:id" do 
       get_bulletin 
        if @bulletin.user == current_user
           @bulletin.delete  
        end
        redirect "/bulletins"
    end 

    private 

    def get_bulletin 
      @bulletin = Bulletin.find_by_id(params[:id]) 
    end

end