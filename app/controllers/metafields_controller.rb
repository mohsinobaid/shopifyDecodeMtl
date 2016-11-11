class MetafieldsController < ApplicationController
    def new
        @metafield = Metafield.new
    end

    def show
        json_response = {
            user_email: params[:email]
        }
        render json: json_response
    end
end
