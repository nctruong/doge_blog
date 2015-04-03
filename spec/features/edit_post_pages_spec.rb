require 'rails_helper'

describe "the edit post process" do

  it "edits an active post" do
    post = FactoryGirl.create(:post)
    sign_in(post.user)
    visit post_path(post)
    click_on 'Edit'
    fill_in "Post Title", :with => "Test Title"
    fill_in "Post Text", :with => "Test Text"
    click_on "Update Post"
    expect(page).to have_content "Successfully"
  end

  it "displays an error if the edit post process fails" do
    post = FactoryGirl.create(:post)
    sign_in(post.user)
    visit post_path(post)
    click_on 'Edit'
    fill_in "Post Title", :with => ""
    click_on "Update Post"
    expect(page).to have_content "blank"
  end

end
