class AddPolymorphicAssociationToVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :user_id
    remove_column :votes, :post_id
    remove_column :votes, :comment_id

    add_column :votes, :voteable_id, :integer
    add_column :votes, :voteable_type, :string
  end
end
