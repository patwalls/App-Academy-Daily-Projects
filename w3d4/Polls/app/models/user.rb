# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :id, uniqueness: true
  validates :name, presence: true

  has_many :polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id

  has_many :responses
    # foreign_key: :user_id,
    # primary_key: :id,
    # class_name: "Response"

  has_many :questions,
    through: :responses

end
