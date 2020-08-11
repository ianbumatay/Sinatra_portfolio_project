class BullitinController <ApplicationController  

    get "/bullitins" do 
        @bullitins = Bullitin.all 

        erb :"/bullitins/index" 
    end

end