class ClientsController < ApplicationController

# 
#     get "/clients" do
#         erb :"/clients/index.html"
#     end

    get "/register" do
        erb :"/clients/new.html"
    end

    post "/clients" do
        raise params.inspect
    end


#     get "/clients/:id" do
#         erb :"/clients/show.html"
#     end
# 
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
