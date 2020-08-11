class BullitinController <ApplicationController  

    get "/bullitins" do 
        @bullitins = Bullitin.all 

        erb :"/bullitins/index" 
    end 

    get "/bullitins/new" do 
        erb :"/bullitins/new" 
    end 

    post "/bullitins" do  
        #binding.pry
       @bullitin = Bullitin.create(title: params[:title], content: params[:content])

       redirect "/bullitins/#{@bullitin.id}"
    end 

    get "/bullitins/:id" do  
        #binding.pry
        @bullitin = Bullitin.find(params[:id]) 

        erb :"/bullitins/show" 
    end 
    
    get "/bullitins/:id/edit" do  
        @bullitin = Bullitin.find(params[:id]) 

        erb :"/bullitins/edit" 
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