class DrinksController < ApplicationController
    before "/drinks/*" do
        authetication_required
    end

    get "/drinks" do
        @drinks = current_client.drinks
        erb :"/drinks/index.html"
    end

    get "/drinks/new" do
        erb :"/drinks/new.html"
    end

    post "/drinks" do
        if has_content
            @drinks = create_drink
            redirect "/drinks/#{@drinks.id}"
        else
            redirect '/drinks/new'
        end
    end

    get "/drinks/:id" do
        @drinks = current_client.drinks.find(params[:id])
        erb :"/drinks/show.html"
    end

    get '/drinks/:id/edit' do
        erb :"/drinks/edit.html"
    end

    delete "/drinks/:id/delete" do
        redirect "/drinks"
    end









    private


    def has_content
        params[:name] != "" && params[:quantity] != ""
    end

    def create_drink
        Drink.create(name: params[:name], quantity: params[:quantity], category: params[:category], client_id: current_client.id)
    end

    def drink_search
        @drinks = Drink.find(params[:id])
    end


 
    get "/drinks/:id/edit" do
        erb :"/drinks/edit.html"
    end

    # PATCH: /drinks/5
    patch "/drinks/:id" do
        redirect "/drinks/:id"
    end

    # DELETE: /drinks/5/delete
end
