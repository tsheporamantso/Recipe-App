require 'rails_helper'

RSpec.describe 'Food new view, it should', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    visit new_user_food_path(@user)
  end

  it 'display form to create new food' do
    expect(page).to have_field('food_name')
    expect(page).to have_field('food_measurement_unit')
    expect(page).to have_field('food_price')
    expect(page).to have_field('food_quantity')
    expect(page).to have_button('Create Food')
  end

  it 'create new food when the form is submitted' do
    fill_in('food_name', with: 'Test Food')
    select('mg', from: 'food_measurement_unit')
    fill_in('food_price', with: 20)
    fill_in('food_quantity', with: 30)
    click_button('Create Food')
    expect(page).to have_current_path(user_foods_path(@user))
    expect(page).to have_content('Test Food')
  end
end


