require 'rails_helper'

describe "the post deletion process" do
  it "deletes and active post" do
    post = FactoryGirl.create(:post)
    sign_in(post.user)
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content "Deleted"
  end
end
