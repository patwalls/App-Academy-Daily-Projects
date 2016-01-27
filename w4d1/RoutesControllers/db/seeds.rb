# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:username => 'Kevin')
User.create!(:username => 'Pat')
User.create!(:username => 'Jane')

Contact.create!(:email => 'John@gmail.com', :name => 'John', :user_id => 3)
Contact.create!(:email => 'Jeff@gmail.com', :name => 'Jeff', :user_id => 1)
Contact.create!(:email => 'Kyle@gmail.com', :name => 'Kyle', :user_id => 1)
Contact.create!(:email => 'Jeff@gmail.com', :name => 'Jeff', :user_id => 2)


ContactShare.create!(:user_id => 1, :contact_id => 2)
ContactShare.create!(:user_id => 1, :contact_id => 3)
ContactShare.create!(:user_id => 2, :contact_id => 3)

Comment.create!(:author_id => 1, :user_id => 2, :body => "a body" )
Comment.create!(:author_id => 1, :contact_id => 1, :body => "a body2" )
Comment.create!(:author_id => 2, :contact_id => 1, :body => "a bodygsdfg" )
Comment.create!(:author_id => 3, :contact_id => 2, :body => "a bodyhgtjhrty" )
