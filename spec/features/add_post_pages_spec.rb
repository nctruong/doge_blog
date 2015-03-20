require 'rails_helper'

describe "the post add process" do
  it "adds a new blog post" do
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', :with => "New Post"
    fill_in 'Post text', :with => "We love integration testing!"
    click_on 'Create Post'
    expect(page).to have_content 'Current'
  end

  it "gives error when no title is entered" do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content 'errors'
  end
end
