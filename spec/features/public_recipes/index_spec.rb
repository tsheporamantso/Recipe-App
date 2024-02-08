require 'rails_helper'

RSpec.feature 'Public_Recipes#index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Sasha', email: 'sasha12@gmail.com', password: 'qwerty')
    @recipe = Recipe.create(name: 'Curry', description: 'Very nice one', cooking_time: 10, preparation_time: 20,
                            public: true, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
    visit authenticated_root_path
  end

  scenario 'show recipe details on page' do
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.description
    expect(page).to have_content @recipe.cooking_time
    expect(page).to have_content @recipe.preparation_time
    expect(page).not_to have_content 'Cheese'
  end

  scenario 'show public status as true' do
    expect(@recipe.public).to be_truthy
  end
end
