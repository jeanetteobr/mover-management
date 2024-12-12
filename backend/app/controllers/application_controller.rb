class ApplicationController < ActionController::API
    def index
        render json: { message: "API is working!" }
      end
end
