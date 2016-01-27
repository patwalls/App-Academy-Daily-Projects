# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Contact',
    dependent: :destroy

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'ContactShare',
    dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :authored_comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Comment'

  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Comment'


end
