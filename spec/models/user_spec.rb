require 'rails_helper'


RSpec.describe User, type: :model do
 describe 'Validations' do
  it "User should signup with all credentials" do 
      @user = User.new(firstname: "Freddy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
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
     @user1 =User.new( firstname: "sandy", lastname: "Eddy", email: "freddyEddy@gmail.com",password: "345asd",password_confirmation:"345asd")
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
     @user1 =User.new( firstname: "sandy", lastname: "Eddy", email: "FREDDYEDDY@GMAIL.COM",password: "345asd",password_confirmation:"345asd")
     @user1.valid?
     expect(@user1.errors[:email]).not_to eq([])
  end
 end 
end
