require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Edi', email: 'edi@gmail.com', password: '123123')
  end

  context 'Testing' do
    it 'Valid user' do
      @user.save
      expect(@user).to be_valid
    end
    it 'Name must be presented' do
      @user.name = "Ali"
      @user.save
      expect(@user).to be_valid
    end

    it 'Email must be presented' do
      @user.email = "ali@gmail.com"
      @user.save
      expect(@user).to be_valid
    end

    it 'Password must have 6 or more characters' do
      @user.password = "1234"
      @user.save
      expect(@user).to_not be_valid
    end
  end
end