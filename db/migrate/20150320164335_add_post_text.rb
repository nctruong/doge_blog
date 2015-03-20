class AddPostText < ActiveRecord::Migration
  def change
    add_column :posts, :post_text, :string
  end
end
