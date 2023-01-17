require 'bcrypt'
class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        current_user=User.find_by_id(session[:current_user_id])
        render json: current_user
    end

    def create
         usr = User.find_by('email': params[:email])
        if (usr.nil?)
            render json: "Account does not exist. Kindly use user route and Post API to create user."
        else
            if (usr.authenticate(params[:password]))
                session[:current_user_id] = usr.id
                render json: "Sucessfully Logged In"
            else 
                render json: "Incorrect Password! Kindly enter valid password."
            end            
        end 

    end


end
