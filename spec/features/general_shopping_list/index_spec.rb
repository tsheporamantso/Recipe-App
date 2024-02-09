require 'rails_helper'

RSpec.feature 'General_Shopping_List#index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    @food = Food.create(name: 'Test Food', measurement_unit: 'test', price: 10, quantity: 20, user_id: @user.id)
    5.times { |i| Food.create(name: "Food ##{i}", measurement_unit: 'unit', price: 1, quantity: 10, user_id: @user.id) }
    visit user_foods_path(@user)
  end

  scenario 'show food details on page' do
    expect(page).to have_content @food.name
    expect(page).to have_content @food.quantity
    expect(page).to have_content @food.measurement_unit
    expect(page).to have_content @food.price
    expect(page).not_to have_content 'Cheese'
  end
end
