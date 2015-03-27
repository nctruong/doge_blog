require 'rails_helper'

describe Post do
  it { should belong_to :user }
  it { should have_many :comments }
  it { should validate_presence_of :title }
  it { should validate_presence_of :post_text }
end
