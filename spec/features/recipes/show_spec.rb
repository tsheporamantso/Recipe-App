require 'rails_helper'

RSpec.describe 'Recipe show view page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    @recipe = Recipe.create(
      name: 'Beef BBQ',
      description: 'Season well with spices of your choice and put in smoke grill',
      preparation_time: 10,
      cooking_time: 10,
      public: false,
      user_id: @user.id
    )
    visit user_recipe_path(@user, @recipe)
  end

  it 'should display the name of the recipe' do
    expect(page).to have_content(@recipe.name)
  end

  it 'should display the description of the recipe' do
    expect(page).to have_content(@recipe.description)
  end

  it 'should display preparation of recipe' do
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'should display cooking time of the recipe' do
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'should have a button to add ingredients' do
    expect(page).to have_button('Add ingredients')
  end

  it 'should have a button to generate a shopping list' do
    expect(page).to have_button('Generate Shopping List')
  end
end
