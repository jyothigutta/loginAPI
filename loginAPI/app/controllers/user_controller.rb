require 'bcrypt'
class UserController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        
        u = User.create(
            'name': params[:name],
            'email': params[:email],
            'password': params[:password]
        )
        if u.errors.any?
             render json: "User already exists. Kindly login"
        else 
            
             render json: "User created Sucessfully!"
        end 
    end



    # def index
    #     u=User.all
    #     render json: u
    # end

    def index
        current_logged_user=User.find_by_id(session[:current_user_id])
        
        if current_logged_user
            render json: current_logged_user
        else 
            
            render json: "Kindly login to view your details."
        end
    end

end
