require 'rails_helper'

RSpec.describe 'Model tests', type: :model do
  describe Tea do
    describe 'Validations' do
      # customer = Customer.create!(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
      # tea = Tea.create(title: 'Earl Grey', description: 'Berry and fruit flavors.', temperature: 145.50, brew_time: 6)
      # subscription = customer.subscriptions.create!(title: 'ABC Tea Company', price: 20.50, status: 'active', frequency: 'monthly', tea_id: tea.id )
      it { should validate_presence_of :title }
      it { should validate_presence_of :description }
      it { should validate_presence_of :temperature }
      it { should validate_presence_of :brew_time }
    end 
  end
end