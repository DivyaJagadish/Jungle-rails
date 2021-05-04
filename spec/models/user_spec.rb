require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'Validations' do
    it "User should signup with all credentials" do 
      @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd", password_confirmation:"12345asd")
      @user.valid?
      expect(@user.errors.full_messages).to eq([])
    end 

    it "User shouldn't signup if password and password_confirmation are different" do 
    @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345ad")
    @user.valid?
    expect(@user.errors[:password_confirmation]).not_to eq([])
    end 

    it "User shouldn't signup if email all ready exists" do
    @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
    @user.save
    @user1 =User.new( firstname: "sandy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "345asdrt",password_confirmation:"345asdrt")
    @user1.valid?
    expect(@user1.errors[:email]).not_to eq([])
    end

    it("User shouldn't signup if Firstname is not entered") do
    @user = User.new(lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
    @user.valid?
    expect(@user.errors[:firstname]).not_to eq([])
    end
    it("User shouldn't signup if Lastname is not entered") do
    @user = User.new(firstname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
    @user.valid?
    expect(@user.errors[:lastname]).not_to eq([])
    end
    it("User shouldn't signup if email is not entered") do
    @user = User.new(firstname: "Eddy", lastname: "Sunny",password: "12345asd",password_confirmation:"12345asd")
    @user.valid?
    expect(@user.errors[:email]).not_to eq([])
    end
    it "emails should be not be case-sensitive" do
    @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
    @user.save
    @user1 =User.new( firstname: "sandy", lastname: "Eddy", email: "FREDDYEDDY@GMAIL.COM",password: "345asdrt",password_confirmation:"345asdrt")
    @user1.valid?
    expect(@user1.errors[:email]).not_to eq([])
    end
    it "Password should have aminimum length of 8" do
    @user =User.new( firstname: "sandy", lastname: "Eddy", email: "FREDDYEDDY@GMAIL.COM",password: "345er",password_confirmation:"345er")
    @user.valid?
    expect(@user.errors[:password]).not_to eq([])
    end
 end 

 describe '.authenticate_with_credentials' do
    it "Should login with correct credentials" do
     @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
     @user.save
     expect(User.authenticate_with_credentials("freddyEddy@gmail.com","12345asd")).not_to eq(nil)
    end
    it "Should not login with incorrect credentials" do
     @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
     @user.save
     expect(User.authenticate_with_credentials("freddyEddy@gmail.com","12345a5678")).to eq(nil)
    end

    it "Should login if the email has trailing whitespaces" do
     @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
     @user.save
     expect(User.authenticate_with_credentials("    freddyEddy@gmail.com","12345asd")).not_to eq(nil)
    end

    it "Should login if email is in uppercase" do
     @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
     @user.save
     expect(User.authenticate_with_credentials("FREDDYEDDY@gmail.com","12345asd")).not_to eq(nil)
    end
  end
end
