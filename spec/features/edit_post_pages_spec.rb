require 'rails_helper'

describe "the edit post process" do
  it "edits a post" do
    post = Post.create(:title => 'My Thoughts Today', :post_text => 'Wow such integration testing!')
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Post Text', :with => 'Such changed mind'
    click_on 'Update Post'
    expect(page).to have_content 'Successfully'
  end

  it "displays error when no post text is entered" do
    post = Post.create(:title => 'My Thoughts Today', :post_text => 'Such Doge Thoughts, Wow Universe')
    visit post_path(post)
    click_on 'Edit'
    fill_in 'Post Text', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end
end
