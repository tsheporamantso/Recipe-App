require 'rails_helper'

RSpec.describe 'Test Recipes index view page', type: :feature do
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
    5.times do |i|
      Recipe.create(
        name: "Beef BBQ ##{i}",
        preparation_time: 5,
        cooking_time: 10,
        description: "Season well with spices of your choice and put in smoke grill ##{i}",
        public: false,
        user_id: @user.id
      )
    end
    visit user_recipes_path(@user)
  end

  it 'should display the name of each recipe' do
    @user.recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
    end
  end

  it 'display recipes description' do
    @user.recipes.each do |recipe|
      expected_truncated_description = truncate(recipe.description, length: 30)
      expect(page).to have_content(expected_truncated_description)
    end
  end

  it 'display button to add new recipe' do
    expect(page).to have_link('New Recipe', href: new_user_recipe_path(@user))
  end

  it 'links to the new page when the button new recipe is clicked' do
    click_link('New Recipe', href: new_user_recipe_path(@user))
    expect(page).to have_current_path(new_user_recipe_path(@user))
  end
end
