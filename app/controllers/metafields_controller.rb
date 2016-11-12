class MetafieldsController < ApplicationController
<<<<<<< HEAD
    def show
        # Responds with found metafield corresponding to id, or an empty string
        # /metafields/id
        # Params:
        # +id+:: id used to identify the user in the metafield


        begin
            field = ShopifyAPI::Metafield.find(params[:id])
        rescue
            field = ''
        end
        
        json_response = {
            metafield: field
        }

        render json: json_response
    end

    def index
        # Responds with entire list of metafields from the store
        # /metafields

        fields = ShopifyAPI::Metafield.all
        json_response = {
            metafields: fields
=======
    def new
        @metafield = Metafield.new
    end

    def show
        json_response = {
            user_email: params[:email]
>>>>>>> 80713d3d07c75f6f237547b9879e045af7dddf07
        }
        render json: json_response
    end
end
