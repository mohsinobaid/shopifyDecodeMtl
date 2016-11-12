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
    # +namespace+:: namespace to determine what type of metafield it is
    # +key+:: key to determine what the value corresponds to (user email or id)
    # +val+:: val to determine what the actual value being posted is
    def create

    end

    # Checks if the metafield exists or not by its key
    # Params: the id of the metafield to check
    # Returns: boolean true or false
    def metafield_exists_by_key(key)
        metafields = ShopifyAPI::Metafield.all
        
        for mf in metafields
            if mf.key == key
                return true
            end
        end

        return false
    end

end
