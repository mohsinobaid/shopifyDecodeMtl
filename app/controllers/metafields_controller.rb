class MetafieldsController < ApplicationController
    
    #skip_before_action :verify_authenticity_token

    # Responds with found metafield corresponding to id, or an empty string
    # /metafields/id
    # Params:
    # +id+:: id used to identify the user in the metafield
    def show
        begin
            customer = ShopifyAPI::Customer.find(params[:id])
            field = find_metafield_for_customer(customer)
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

        customers = ShopifyAPI::Customer.all
        result = customers.map{|customer|
            field = find_metafield_for_customer(customer)

            {
                customer_id: customer.id,
                field: field
            }

        }

        json_response = {
            metafields: result
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
        customer = ShopifyAPI::Customer.find(params[:id])
        #respond badly if no id, or key, or value
        # begin
            arr = sanitize params
            #puts "arr is #{arr}"
            #check if the data needs to be created or updated
            metafield = find_metafield_for_customer(customer)
            if not metafield
                action = 'created'
                metafield_params = {
                    key: "credit",
                    value: params[:val],
                    value_type: "integer",
                }
                customer.metafields << metafield_params
                customer.save
            else
                action = 'updated'
                metafield.value = params[:val]
                metafield.save
                # overwrite
            end
            # action can be updated as well
            #respond well
            res = {
                status: 'ok',
                message: "successfully #{action} metafield"
            }
       # rescue
       #     res = {
       #         status: 'failed',
       #         message: 'val and id cannot be empty'
       #     }
       # end
        render json: res
    end

    def sanitize(h)
        toreturn = h
        #byebug
        if not (toreturn.key?('val') and toreturn.key?('id'))
            #raise exception
            raise 'Need val and id to post/put'
        end

        h.each{|key, val|
            puts "#{key.to_s}:#{val.to_s}"
            toreturn[key] = val
            if key.to_s.eql? 'id'
                if val.blank?
                    toreturn[key] = '-1'
                end
            elsif key.to_s.eql? 'val'
                if val.blank?
                    toreturn[key] = '0'
                end
            end
        }
        return toreturn
    end

    # Checks if the metafield exists or not by its key
    # Params: the id of the metafield to check
    # Returns: boolean true or false
    def find_metafield_for_customer(customer)
        metafields = customer.metafields
        metafields.find do |metafield|
            metafield.key == "credit"
        end
    end

    # Use this code to send emails within a controller action:
    # UserMailer.send_credit(name, email_address, credit).deliver_now!
end
