class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable  :sessions
        set :session_secret, "totaldrinks-1243s"
    end

    get "/" do
        erb :welcome
    end

    helpers do
        
        def valid_input
            params[:username] != "" && params[:email] != "" && params[:password] != ""
        end

        def found_client_id
            @client = Client.find_by(id: params[:id])
        end

        def found_client_name
            @client = Client.find_by(username: params[:username])
        end
    end

end
