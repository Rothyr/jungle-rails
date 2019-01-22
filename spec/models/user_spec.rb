require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do

    @user = User.new(
    first_name: 'first',
    last_name:  'last',
    email: 'email@email.com',
    password: '12345678',
    password_confirmation: '12345678'
    )
    end

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without first name' do 
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without last name' do 
      @user.last_name = nil 
      expect(@user).to_not be_valid
    end

    it 'is not valid without email' do 
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do 
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid when password_confirmation does not match password' do
      @user.password_confirmation = '12345677'
      expect(@user).to_not be_valid
    end

    it 'is not valid when email is already in use' do
      @user.save

      user2 = User.new(
        first_name: 'first',
        last_name:  'last',
        email: 'email@email.com',
        password: '12345678',
        password_confirmation: '12345678'
      )
      expect(user2).to_not be_valid
    end

    it 'is not valid when password is less than 8 characters' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      expect(@user).to_not be_valid
    end

    describe '.authenticate_with_credentials' do
      it 'is valid when correct credentials provided' do 
        @user.save

      expect(User.authenticate_with_credentials('email@email.com', '12345678')).to_not be_nil
      end

      it 'is valid with uppercase email address' do
        @user.save

        expect(User.authenticate_with_credentials('EMAIL@EMAIL.com', '12345678')).to_not be_nil
      end

      it 'is not valid with incorrect password' do
        @user.save

        expect(User.authenticate_with_credentials('email@email.com', '12345678910')).to be false
      end

      it 'is valid with spaces in email address' do
        @user.save

        expect(User.authenticate_with_credentials('email@email.com   ', '12345678')).to_not be_nil
      end


    end
  end
end