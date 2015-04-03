require 'rails_helper'

describe "the post add process" do
  it "adds a new blog post" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit posts_path
    click_on 'Make Post'
    fill_in 'Post Title', :with => "New Post"
    fill_in 'Post Text', :with => "We love integration testing!"
    click_on 'Create Post'
    expect(page).to have_content user.username
  end

  it "gives error when no title is entered" do
    user = FactoryGirl.create(:user)
    visit posts_path
    sign_in(user)
    click_on 'Make Post'
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
