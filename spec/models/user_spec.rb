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
  end
end