require 'rails_helper'

RSpec.describe 'Customers API', type: :request do
  let!(:customers) { create_list(:customer, 3) }
  let(:customer_id) { customers.first.id }

  describe 'GET /api/customers' do
    it 'returns all customers' do
      get '/api/customers'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET /api/customers/:id' do
    context 'when the customer exists' do
      it 'returns the customer' do
        get "/api/customers/#{customer_id}"

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['id']).to eq(customer_id)
      end
    end

    context 'when the customer does not exist' do
      it 'returns a not found message' do
        get '/api/customers/999'

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq("Record not found: Couldn't find Customer with 'id'=999")
      end
    end
  end

  describe 'POST /api/customers' do
    context 'when the request is valid' do
      let(:valid_attributes) { { customer: { name: 'John Doe', email: 'john@example.com', phone: '1234567890' } } }

      it 'creates a customer' do
        post '/api/customers', params: valid_attributes

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['name']).to eq('John Doe')
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { customer: { name: '', email: '', phone: '' } } }

      it 'returns validation errors' do
        post '/api/customers', params: invalid_attributes

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Name can't be blank", "Email can't be blank", "Phone can't be blank")
      end
    end
  end

  describe 'PUT /api/customers/:id' do
    let(:valid_attributes) { { customer: { name: 'Updated Name' } } }

    context 'when the customer exists' do
      it 'updates the customer' do
        put "/api/customers/#{customer_id}", params: valid_attributes

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['name']).to eq('Updated Name')
      end
    end

    context 'when the customer does not exist' do
      it 'returns a not found message' do
        put '/api/customers/999', params: valid_attributes

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq("Record not found: Couldn't find Customer with 'id'=999")
      end
    end
  end

  describe 'DELETE /api/customers/:id' do
    context 'when the customer exists' do
      it 'deletes the customer' do
        delete "/api/customers/#{customer_id}"

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the customer does not exist' do
      it 'returns a not found message' do
        delete '/api/customers/999'

        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq("Record not found: Couldn't find Customer with 'id'=999")
      end
    end
  end
end
