require 'rails_helper'

RSpec.describe 'Model tests', type: :model do
  describe Subscription do
    describe 'Validations' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :price }
      it { should validate_presence_of :status }
      it { should validate_presence_of :frequency }
    end
    
    describe 'Associations' do
      it { should belong_to :tea} 
      it { should belong_to :customer} 
    end
  end
end