# require 'spec_helper'
#
# describe "Comments" do
#   it "submits a comment via AJAX" do
#     post = FactoryGirl.create(:post)
#     sign_in(post.user)
#     visit post_path(post)
#     click_on "Add Comment"
#     fill_in "Comment Text", :with => "Phantom Text"
#     click_on "Create Comment"
#     expect(page).to have_content "Phantom"
#   end
# end
