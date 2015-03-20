require 'rails_helper'

describe Comment do
  it { should belong_to :post }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :comment_text }
end