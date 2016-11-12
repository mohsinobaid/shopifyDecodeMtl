class MetafieldsController < ApplicationController
    
    # Responds with found metafield corresponding to id, or an empty string
    # /metafields/id
    # Params:
    # +id+:: id used to identify the user in the metafield
    def show
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

    # Response with the value of the specified id
    # /metafields/id/parse
    # Params:
    # +id+:: id used to identify the user in the metafield
    def parse
        begin
            value = ShopifyAPI::Metafield.find(params[:id]).value
        rescue
            value = ''
        end
            
        json_response = {
            val: value
        }
        render json: json_response
    end

    # Responds with entire list of metafields from the store
    # /metafields
    def index
        fields = ShopifyAPI::Metafield.all
        json_response = {
            metafields: fields
        }
        render json: json_response
    end
    
    # Creates a metafield, or updates one if it exists already
    # Params:
    # +id+:: id used to identify the user in the metafield
    def create

    end
end
