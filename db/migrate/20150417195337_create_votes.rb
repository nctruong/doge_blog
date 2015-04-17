class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :user_id
      t.string :post_id
      t.string :comment_id

      t.timestamps
    end
  end
end
