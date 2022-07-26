require 'rails_helper'

RSpec.describe 'Model tests', type: :model do
  describe Tea do
    describe 'Validations' do
      it { should validate_presence_of :title }
      it { should validate_presence_of :description }
      it { should validate_presence_of :temperature }
      it { should validate_presence_of :brew_time }
    end 

    describe 'Associations' do
      it { should have_many :subscriptions }
    end
  end
end