require 'rails_helper'

RSpec.feature 'General_Shopping_List#index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Sasha', email: 'sasha12@gmail.com', password: 'qwerty')
    @recipe = Recipe.create(name: 'Curry', description: 'Very nice one', cooking_time: 10, preparation_time: 20,
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'Mukimo', measurement_unit: 'grams', price: 50, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
    visit authenticated_root_path
  end

  scenario 'show food details on page' do
    qty = RecipeFood.joins(:food).where(food_id: food.id).sum('quantity')

    expect(page).to have_content @food.name
    expect(page).to have_content qty
    expect(page).to have_content @food.measurement_unit
    expect(page).to have_content @food.price
    expect(page).not_to have_content 'Cheese'
  end
end
