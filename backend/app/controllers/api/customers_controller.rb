module Api
  class CustomersController < ApplicationController
    before_action :set_customer, only: %i[show update destroy]

    # GET /api/customers
    def index
      customers = Customer.all
      render json: customers, status: :ok
    end

    # GET /api/customers/:id
    def show
      render json: @customer, status: :ok
    end

    # POST /api/customers
    def create
      customer = Customer.new(customer_params)

      if customer.save
        render json: customer, status: :created
      else
        render json: { errors: customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PUT /api/customers/:id
    def update
      if @customer.update(customer_params)
        render json: @customer, status: :ok
      else
        render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /api/customers/:id
    def destroy
      if @customer.destroy
        head :no_content
      else
        render json: { errors: @customer.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: "Record not found: #{e.message}" }, status: :not_found
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :address)
    end
  end
end
