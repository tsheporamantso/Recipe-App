require 'rails_helper'

RSpec.describe 'Testing Food#index view, it should', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, quantity: 20, user_id: @user.id)
    5.times { |i| Food.create(name: "Food ##{i}", measurement_unit: 'unit', price: 1, quantity: 10, user_id: @user.id) }
    visit user_foods_path(@user)
  end

  it 'display the name of each of the foods' do
    @user.foods.each do
      expect(page).to have_content(@food.name)
    end
  end

  it 'display the measurement unit of the food' do
    @user.foods.each do |food|
      expect(page).to have_content(food.measurement_unit)
    end
  end

  it 'display the price of the food' do
    @user.foods.each do |food|
      expect(page).to have_content(food.price)
    end
  end

  it 'display the quantity of the food' do
    @user.foods.each do |food|
      expect(page).to have_content(food.quantity)
    end
  end

  it 'display button to add new food' do
    expect(page).to have_link('Add food', href: new_user_food_path(@user))
  end

  it 'display button to remove food' do
    @user.foods.each do |food|
      expect(page).to have_selector(
        "form[action='#{user_food_path(@user, food)}'][method='post'] button[type='submit']", text: 'Remove'
      )
    end
  end

  it 'navigates to the new page when the button is clicked' do
    click_link('Add food', href: new_user_food_path(@user))
    expect(page).to have_current_path(new_user_food_path(@user))
  end
end
