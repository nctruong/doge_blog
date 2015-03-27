require 'rails_helper'

describe "the user log in process" do
  it "allows a user to log in" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Log In'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content 'successfully'
  end

  it "displays an error when fields are blank or incorrect" do
    visit root_path
    click_on "Log In"
    click_on "Log in"
    expect(page).to have_content 'Invalid'
  end
end
