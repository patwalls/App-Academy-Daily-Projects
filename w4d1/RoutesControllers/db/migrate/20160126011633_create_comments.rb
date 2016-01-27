class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id
      t.integer :user_id
      t.integer :contact_id
      t.text :body

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :user_id
    add_index :comments, :contact_id
  end
end
