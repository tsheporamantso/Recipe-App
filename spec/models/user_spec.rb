require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      name: 'Tshepo',
      email: 'tgramantso@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'should be valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'should not be valid without the name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without the password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
