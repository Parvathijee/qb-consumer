require "bundler/setup"
#require 'sinatra'
require 'json'
require 'openssl'
#require 'base64'
#require 'omniauth'
#require 'omniauth-quickbooks'
require 'dotenv'
require 'qbo_api'
#Dotenv.load "#{__dir__}/../.env"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  qbo_api = QboApi.new(token: "lvprdbPDaSOa6gnIFWeQtFKwGrRLM6XE6QgxtE2uJkO4nDU0",
                        token_secret:"PKzCT1E4RfuPyMvoZThJep00ZNqv0Jw3bNuLIMJl",
                        realm_id: "123145840867442",
                        consumer_key: "qyprdWbwiAT3vWMnQljJNVow0grJk0",
                        consumer_secret: "tBEceZmmaOIpZnZGtXUAmijBySGgiO9czCPB8R9L")
                        @name = "Lakshmi"
  if(qbo_api)
    
    @resp = qbo_api.get :customer, 3
    @name = @resp['DisplayName']
    @name ="Parvathi"
  end
else
    @name = "EMPTY"                      
  
end
