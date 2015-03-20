require 'rails_helper'


describe "the post deletion process" do
  it "deletes a post" do
    post = Post.create(:title => 'My Thoughts Today', :post_text => 'Wow such integration testing!')
    visit post_path(post)
    click_on 'Delete'
    expect(page).to have_content 'Deleted'
  end
end
