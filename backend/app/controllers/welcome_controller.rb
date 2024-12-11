class WelcomeController < ApplicationController

  def index
    Rails.logger.debug("Headers: #{request.headers.to_h}")
    Rails.logger.debug("Params: #{params.inspect}")
    render json: { message: "Welcome to the Mover Management System!" }
  end
end
