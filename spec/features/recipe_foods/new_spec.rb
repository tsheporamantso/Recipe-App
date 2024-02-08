require 'rails_helper'

RSpec.describe 'Test Recipe Food new view', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(
      name: 'Beef BBQ',
      preparation_time: 5,
      cooking_time: 10,
      description: 'Season well with spices of your choice and put in smoke grill',
      public: true,
      user_id: @user.id
    )
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, quantity: 20, user_id: @user.id)
    visit new_user_recipe_recipe_food_path(@user, @recipe)
  end

  it 'display form to add new recipe food' do
    expect(page).to have_field('recipe_food_food_id')
    expect(page).to have_field('recipe_food_quantity')
    expect(page).to have_button('Add Ingredient')
  end

  it 'add food to recipe when the form is submitted' do
    select(@food.name, from: 'Food')
    fill_in('recipe_food_quantity', with: 10)
    click_button('Add Ingredient')
    expect(page).to have_current_path(user_recipe_path(@user, @recipe))
    expect(page).to have_content('Test Food')
  end
end