require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(email: 'tgramantso@gmail.com', password: 'password123')
    @recipe = Recipe.new(
      name: 'CheeseCake', 
      preparation_time: 10, 
      cooking_time: 5, 
      description: 'Delicious with cream',
      public: true, 
      user: @user
      )
      @food = Food.new(
        name: 'cheese',
        quantity: 100
      )
      @recipe_food = RecipeFood.new(
        quantity: 100,
        recipe: @recipe,
        food: @food
      )
  end

  describe 'validations' do
    it 'is valid with correct attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'should not be valid without quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'should not be valid with negative quantity value' do
      @recipe_food.quantity = -1
      expect(@recipe_food).to_not be_valid
    end
  end
end
