class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id
      t.string :long_url
      t.string :short_url
      t.timestamps
    end
  end
end
