require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'is valid with correct attributes' do
      user = User.create(email: 'tgramantso@gmail.com', password: 'password123')
      food = Food.new(name: 'CheeseCake', measurement_unit: 'kg', price: 5, quantity: 50, user:)
      
      expect(food).to be_valid
    end
  end
end
