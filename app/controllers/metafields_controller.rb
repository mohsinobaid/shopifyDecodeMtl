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

    # Responds with entire list of metafields from the store
    # /metafields
    def index
        fields = ShopifyAPI::Metafield.all
        json_response = {
            metafields: fields
        }
        render json: json_response
    end

    # Receives the metafield, and posts/puts based on if the metafield exists in the store
    # such that the metafield will be updated and not overwritten if it exists
    # /metafields/??
    # Params:
    # +metafield+:: metafield used to be created or updated
    def create

    end
end
