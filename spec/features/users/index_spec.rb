require 'rails_helper'

RSpec.describe 'Test User index view page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tshepo', email: 'example@test.com', password: '123456')
    sign_in @user
    visit root_path
  end

  it 'should greet the user' do
    expect(page).to have_content("Welcome to our Recipe App Dear: #{@user.name}")
  end
end