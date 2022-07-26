require 'rails_helper'

RSpec.describe 'Subscription API' do
  # An endpoint to subscribe a customer to a tea subscription
  it 'should subscribre a customer to a tea subscription' do
    Customer.destroy_all
    tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
    customer = Customer.create!(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
      }

    body = { "title": "ABC Tea Company", "price": "20.50", "status": "active", "frequency": "monthly", "tea_id": tea.id, "customer_id": customer.id }
    
    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(body)
    
    subscriptions = Customer.first.subscriptions

    expect(response.status).to eq(201)
    expect(subscriptions.count).to eq(1) 
    expect(subscriptions.first.title).to eq('ABC Tea Company')
    expect(subscriptions.first.price).to eq(20.50)
    expect(subscriptions.first.status).to eq('active')
    expect(subscriptions.first.frequency).to eq('monthly')
    expect(subscriptions.first.tea_id).to eq(tea.id)
  end 
end
