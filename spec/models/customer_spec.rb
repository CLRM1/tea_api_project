require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    customer = Customer.create!(first_name: "Sophie", last_name: "Romero", email: "sophie@mail.com", address: "101 Main St. Denver, CO")
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end 
end