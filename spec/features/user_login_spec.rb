require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    @user = User.create!(firstname: "Freddy", lastname: "Eddy", email: "freddyeddy@gmail.com",password: "12345asd",password_confirmation:"12345asd")
  end
  scenario "Logs in new user and takes to home page " do
    visit login_path
    fill_in "email", with: "FREDDYEDDY@gmail.com"
    fill_in "password", with: "12345asd"
    click_on("Submit")
     expect(page).to have_content "Products"
  end

   scenario "Shows logout in nav bar when user is logged in " do
    visit login_path
    fill_in "email", with: "FREDDYEDDY@gmail.com"
    fill_in "password", with: "12345asd"
    click_on("Submit")
     expect(page).to have_content "Logout"
  end
end
