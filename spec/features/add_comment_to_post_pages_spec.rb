require 'rails_helper'

describe "the comment add process" do
  it "adds a comment to a post", js: true do
    post = FactoryGirl.create(:post)
    sign_in(post.user)
    visit post_path(post)
    save_and_open_page
    click_on "Add Comment"
    fill_in "Comment Text", :with => "Such Agree"
    click_on "Create Comment"
    expect(page).to have_content "Saved!"
  end

  it "displays an error when comment text is blank" do
    post = FactoryGirl.create(:post)
    sign_in(post.user)
    visit post_path(post)
    click_on "Add Comment"
    click_on "Create Comment"
    expect(page).to have_content "can't be blank"
  end
end
