require 'rails_helper'

RSpec.describe User, type: :model do

  before do

    @user = User.new(
      first_name: "Anything",
      last_name: "Anything",
      email: "christopherjkang24@gmail.com",
      password: "tango123",
      password_confirmation: "tango123"
    )

  end

  # describe 'Validations' do

  #   it 'is not valid without a password' do
  #     user = User.new(
  #       first_name: "Anything",
  #       last_name: "Anything",
  #       email: "christopherjkang24@gmail.com",
  #       password: "tango",
  #       password_confirmation: ""
  #   )

  #     user.save
     
  #     expect(user).to_not be_valid
  #   end

  #   it 'has matching passwords in both PW and PW confirmation fields' do
  #     expect(@user.password).to eql(@user.password_confirmation)
  #   end

  #   it 'should have a unique email' do
  #     user = User.new(      
  #       first_name: "Anything",
  #       last_name: "Anything",
  #       email: "christopherjkang24@gmail.com",
  #       password: "tango123",
  #       password_confirmation: "tango123"
  #     ) 
  #     user.save 

  #     user1 = User.new(      
  #       first_name: "Anything",
  #       last_name: "Anything",
  #       email: "CHRISTOPHERJKANG24@GMAIL.COM",
  #       password: "tango123",
  #       password_confirmation: "tango123"
  #     )
  #     user1.save 

  #     expect(user1).to_not be_valid
  #   end

  #   it 'is not valid without an email' do
  #     @user.email = nil
  #     expect(@user).to_not be_valid
  #   end

  #   it 'is not valid without a first name' do
  #     @user.first_name = nil
  #     expect(@user).to_not be_valid
  #   end

  #   it 'is not valid without a last name' do
  #     @user.last_name = nil
  #     expect(@user).to_not be_valid
  #   end

  #   it 'should have a password length of at least 6' do
  #     user1 = User.new(      
  #       first_name: "Anything",
  #       last_name: "Anything",
  #       email: "CHRISTOPHERJKANG24@GMAIL.COM",
  #       password: "tango",
  #       password_confirmation: "tango"
  #     )

  #     user1.save 
  #     expect(user1).to_not be_valid
  #   end 
  # end

  describe '.authenticate_with_credentials' do

    it 'should login the user if credentials are correct' do
      user = User.new(      
        first_name: "Anything",
        last_name: "Anything",
        email: "christopherjkang25@gmail.com",
        password: "tango123",
        password_confirmation: "tango123"
      )

      user.save

      user1 = User.authenticate_with_credentials("christopherjkang25@gmail.com", "tango123")
      expect(user1).to be == user
    end

    it 'should not login the user if credentials are incorrect' do
      user = User.new(      
        first_name: "Anything",
        last_name: "Anything",
        email: "christopherjkang24@gmail.com",
        password: "tango123",
        password_confirmation: "tango123"
      )

      user.save

      user1 = User.authenticate_with_credentials("christopherjkang25@gmail.com", "tango123")
      expect(user1).to_not be == user 
    end

    it 'should login the user even if there are spaces before or after the email' do
      user = User.new(      
        first_name: "Anything",
        last_name: "Anything",
        email: "christopherjkang24@gmail.com",
        password: "tango123",
        password_confirmation: "tango123"
      )

      user.save

      user1 = User.authenticate_with_credentials(" christopherjkang24@gmail.com ", "tango123")
      expect(user1).to be == user
    end

    it 'should login the user even if there are case sensitive characters in the email' do
      user = User.new(      
        first_name: "Anything",
        last_name: "Anything",
        email: "christopherjkang24@gmail.com",
        password: "tango123",
        password_confirmation: "tango123"
      )

      user.save

      user1 = User.authenticate_with_credentials("CHRISTOPHERJKANG24@gmail.com", "tango123")
      expect(user1).to be == user
    end

  end

end


