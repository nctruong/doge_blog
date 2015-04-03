require 'rails_helper'

describe "the edit comment process" do
  it "edits an active comment" do
    comment = FactoryGirl.create(:comment)
    sign_in(comment.post.user)
    visit post_path(comment.post)
    click_on '(edit)'
    fill_in 'Comment Text', with: "Different Stuff!"
    click_on 'Update Comment'
    expect(page).to have_content "Comment Updated!"
  end

  it "displays an error when comment text is blank" do
    comment = FactoryGirl.create(:comment)
    sign_in(comment.post.user)
    visit post_path(comment.post)
    click_on '(edit)'
    fill_in 'Comment Text', with: ""
    click_on 'Update Comment'
    expect(page).to have_content "can't be blank"
  end
end
