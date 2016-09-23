require 'qbo_api'
require 'json'
#require 'omniauth'
#require 'omniauth-quickbooks'
#require 'sinatra'
require 'dotenv'
#Dotenv.load "#{__dir__}/../.env"

class EmployeesController < ApplicationController

  def index
  qbo_api = QboApi.new(token: "lvprdbPDaSOa6gnIFWeQtFKwGrRLM6XE6QgxtE2uJkO4nDU0",
                        token_secret:"PKzCT1E4RfuPyMvoZThJep00ZNqv0Jw3bNuLIMJl",
                        realm_id: "123145840867442",
                        consumer_key: "qyprdWbwiAT3vWMnQljJNVow0grJk0",
                        consumer_secret: "tBEceZmmaOIpZnZGtXUAmijBySGgiO9czCPB8R9L")
                        
  
  #@name = "Lakshmi"
  rescue => e 
    #QboApi::BadRequest => e
    if(e.message)
      @name = e.message
    end
  else 
    @name = 'parvathi'
     
 #   if(qbo_api)
    @resp = qbo_api.get :customer, 5
    @name = @resp['DisplayName']
    
    
    invoice = {
        "Line": [
          {
            "Amount": 100.00,
            "DetailType": "SalesItemLineDetail",
            "SalesItemLineDetail": {
              "ItemRef": {
                "value": "1",
                "name": "Services"
              }
            }
          }
        ],
        "CustomerRef": {
          "value": "1"
        }
      }
      @response = qbo_api.create(:invoice, payload: invoice)
      @id = @response['Id']
        #@name ="Parvathi"
  #  end
  #  else    @name = "EMPTY"
end





def invoice

  qbo_api = QboApi.new(token: "lvprdbPDaSOa6gnIFWeQtFKwGrRLM6XE6QgxtE2uJkO4nDU0",
                        token_secret:"PKzCT1E4RfuPyMvoZThJep00ZNqv0Jw3bNuLIMJl",
                        realm_id: "123145840867442",
                        consumer_key: "qyprdWbwiAT3vWMnQljJNVow0grJk0",
                        consumer_secret: "tBEceZmmaOIpZnZGtXUAmijBySGgiO9czCPB8R9L")
                        
  invoice = {
      "Line": [
        {
          "Amount": 100.00,
          "DetailType": "SalesItemLineDetail",
          "SalesItemLineDetail": {
            "ItemRef": {
              "value": "1",
              "name": "Services"
            }
          }
        }
      ],
      "CustomerRef": {
        "value": "1"
      }
    }
    @response = qbo_api.create(:invoice, payload: invoice)
    
end


end    
    
