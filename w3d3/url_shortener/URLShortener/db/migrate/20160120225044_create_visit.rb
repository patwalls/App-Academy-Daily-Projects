class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :shorturl_id

      t.timestamps
    end
  end
end
