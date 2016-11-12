class MetafieldsController < ApplicationController
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
        }
        render json: json_response
    end

    def create
        # Receives the metafield, and posts/puts based on if the metafield exists in the store
        # such that the metafield will be updated and not overwritten if it exists
        # /metafields/??
        # Params:
        # +metafield+:: metafield used to be created or updated

    end
end
