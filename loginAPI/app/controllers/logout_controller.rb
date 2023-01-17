class LogoutController < ApplicationController
    def index
        session[:current_user_id] = nil
        render json: "Logged out"
    end
end
