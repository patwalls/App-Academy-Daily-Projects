# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  User.create(:email => "joeshmoe@gmail.com", premium: true)
  User.create(:email => "bobvance@gmail.com")
  User.create(:email => "legoflyer123@hotmail.com")

  ShortenedURL.create_for_user_and_long_url!(User.first,"google.com")
  ShortenedURL.create_for_user_and_long_url!(User.all[1],"facebook.com")
  ShortenedURL.create_for_user_and_long_url!(User.all[2],"reddit.com")

  TagTopic.create(:tag => "news")
  TagTopic.create(:tag => "lolz")

  Tagging.create(:tag_id => 1, :url_id => 1)
  Tagging.create(:tag_id => 2, :url_id => 3)

  Visit.create(:user_id => 1, :shorturl_id => 1)
  Visit.create(:user_id => 2, :shorturl_id => 2)
  Visit.create(:user_id => 3, :shorturl_id => 3)
end
