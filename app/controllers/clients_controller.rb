class ClientsController < ApplicationController
    before "/clients/*" do
        authetication_required
    end

    get "/register" do
        erb :"/clients/new.html"
    end
    
    post "/register" do
        if valid_input
            @client = Client.create(params)
            session[:client_id] = @client.id
            redirect "/clients/#{@client.id}"
        else
            redirect '/'
        end
    end
    
    get "/login" do
        erb :"/clients/login.html"
    end
    
    post "/login" do
        found_client_name
        if @client && @client.authenticate(params[:password])
            session[:client_id] = @client.id
            redirect "/clients/#{@client.id}"
        else
            redirect '/'
        end
    end
    
    get "/clients/:id" do
        found_client_id
        erb :"/clients/show.html"
    end

    private

    def valid_input
        params[:username] != "" && params[:email] != "" && params[:password] != ""
    end

    def found_client_id
        @client = Client.find_by(id: params[:id])
    end

    def found_client_name
        @client = Client.find_by(username: params[:username])
    end

    
    # 
    #     get "/clients" do
    #         erb :"/clients/index.html"
    #     end
#     get "/clients/:id/edit" do
#         erb :"/clients/edit.html"
#     end
# 
# 
#     patch "/clients/:id" do
#         redirect "/clients/:id"
#     end
# 
#     delete "/clients/:id/delete" do
#         redirect "/clients"
#     end
end
