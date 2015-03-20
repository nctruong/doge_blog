require 'rails_helper'

describe "the comment add process" do
  it "adds a comment to a blog post" do
    post = Post.create(:title => 'Post Title', :post_text => 'Much Amaz')
    visit post_path(post)
    click_on 'Add Comment'
    fill_in 'User name', :with => 'Doge'
    fill_in 'Comment text', :with => 'Wow so Agree'
    click_on 'Create Comment'
    expect(page).to have_content 'Comment Saved!'
  end

  it "displays error when no user name is entered" do
    post = Post.create(:title => 'Post Title', :post_text => 'Much Amaz')
    visit post_path(post)
    click_on 'Add Comment'
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end
