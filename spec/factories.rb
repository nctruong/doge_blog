FactoryGirl.define do

  factory :user do
    email('user@email.com')
    username('doge')
    password('12345678')
    password_confirmation('12345678')
  end

  factory(:post) do
    title('Wow such title')
    post_text('Lorem Ipsum Dogesum, suchem lorem muchem wow')
    user
  end

  factory(:comment) do
    user_name('doge')
    user_id('1')
    comment_text('Such agree, wow!')
    post
  end

end
