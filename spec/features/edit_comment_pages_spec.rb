require 'rails_helper'

describe "the comment edit process" do
  it "edits a comment" do
    post = Post.create(:title => 'My Thoughts Today', :post_text => 'Wow such integration testing!')
    comment = Comment.create(:user_name => 'Doge', :comment_text => 'Many good things to say', :post_id => post.id)
    visit post_path(post)
    click_on '(edit)'
    fill_in 'Comment Text', :with => 'I forgot this thing!'
    click_on 'Update Comment'
    expect(page).to have_content 'Comment Updated!'
  end

  it "displays an error if comment text is blank" do
    post = Post.create(:title => 'My Thoughts Today', :post_text => 'Wow such integration testing!')
    comment = Comment.create(:user_name => 'Doge', :comment_text => 'Many good things to say', :post_id => post.id)
    visit post_path(post)
    click_on '(edit)'
    fill_in 'Comment Text', :with => ''
    click_on 'Update Comment'
    expect(page).to have_content 'errors'  
  end
end
