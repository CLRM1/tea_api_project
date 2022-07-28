require 'rails_helper'

RSpec.describe 'Subscription API' do
  it 'should subscribe a customer to a tea subscription' do
    Customer.destroy_all
    tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
    customer = Customer.create(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    customer_1 = Customer.create(first_name: "John", last_name: "Romero", email: "john@mail.com", address: "1505 South St. Denver, CO")
    
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
      }

    body = { "title": "ABC Tea Company: Monthly Earl Grey", "price": "20.50", "status": "active", "frequency": "monthly", "tea_id": tea.id, "customer_id": customer.id }
    
    post '/api/v1/subscriptions', headers: headers, params: JSON.generate(body)
    
    subscriptions = Customer.first.subscriptions

    expect(response.status).to eq(201)
    expect(subscriptions.count).to eq(1) 
    expect(subscriptions.first.title).to eq('ABC Tea Company: Monthly Earl Grey')
    expect(subscriptions.first.price).to eq(20.50)
    expect(subscriptions.first.status).to eq('active')
    expect(subscriptions.first.frequency).to eq('monthly')
    expect(subscriptions.first.tea_id).to eq(tea.id)
    expect(customer_1.subscriptions.count).to eq(0)
  end 

  it 'should cancel a customer tea subscription' do
    Customer.destroy_all
    tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
    customer = Customer.create(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    customer_1 = Customer.create(first_name: "John", last_name: "Romero", email: "john@mail.com", address: "1505 South St. Denver, CO")
    subscription = customer.subscriptions.create(title: "ABC Tea Company: Monthly Earl Grey", price: 20.50, status: "active", frequency: "monthly", tea_id: tea.id)
    
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
      }

    body = { "title": "ABC Tea Company: Monthly Earl Grey", "status": "cancelled", "customer_id": customer.id }
    
    put '/api/v1/subscriptions', headers: headers, params: JSON.generate(body)
    
    subscriptions = Customer.first.subscriptions

    expect(response.status).to eq(200)
    expect(subscriptions.count).to eq(1) 
    expect(subscriptions.first.title).to eq('ABC Tea Company: Monthly Earl Grey')
    expect(subscriptions.first.price).to eq(20.50)
    expect(subscriptions.first.status).to eq('cancelled')
    expect(subscriptions.first.frequency).to eq('monthly')
    expect(subscriptions.first.tea_id).to eq(tea.id)
    expect(customer_1.subscriptions.count).to eq(0)
  end

  it 'should return a 404 error when the title or customer_id are missing' do
    Customer.destroy_all
    tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
    customer = Customer.create(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    customer_1 = Customer.create(first_name: "John", last_name: "Romero", email: "john@mail.com", address: "1505 South St. Denver, CO")
    subscription = customer.subscriptions.create(title: "ABC Tea Company: Monthly Earl Grey", price: 20.50, status: "active", frequency: "monthly", tea_id: tea.id)
    
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
      }

    body = { "status": "cancelled", "customer_id": customer.id }
    
    put '/api/v1/subscriptions', headers: headers, params: JSON.generate(body)
    
    subscriptions = Customer.first.subscriptions

    expect(response.status).to eq(404)
    expect(response.body).to include("Error: subscription not found")
  end

  it 'should list a customers tea subscriptions' do
    Customer.destroy_all
    tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
    tea_1 = Tea.create(title: 'Green', description: 'Strong and earthy.', temperature: 147.50, brew_time: 7)
    customer = Customer.create(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    customer_1 = Customer.create(first_name: "John", last_name: "Romero", email: "john@mail.com", address: "1505 South St. Denver, CO")
    subscription = customer.subscriptions.create(title: "ABC Tea Company: Monthly Earl Grey", price: 20.50, status: "active", frequency: "monthly", tea_id: tea.id)
    subscription_1 = customer.subscriptions.create(title: "Whole Tea Company: Weekly Green", price: 17.50, status: "cancelled", frequency: "weekly", tea_id: tea_1.id)

    
    get "/api/v1/customers/#{customer.id}/subscriptions"
    
    subscriptions = Customer.first.subscriptions
    
    expect(response.status).to eq(200)
    expect(response.body).to include("ABC Tea Company: Monthly Earl Grey") 
    expect(response.body).to include("Whole Tea Company: Weekly Green" ) 
    expect(subscriptions.first.status).to eq('active')
    expect(subscriptions[1].status).to eq('cancelled')
  end
end
