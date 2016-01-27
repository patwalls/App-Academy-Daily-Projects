# == Schema Information
#
# Table name: users
#
#  id                                                                    :integer          not null, primary key
#  created_at                                                            :datetime
#  updated_at                                                            :datetime
#  email                                                                 :string
#  #<ActiveRecord::ConnectionAdapters::TableDefinition:0x007fb6f0812500> :string
#  premium                                                               :boolean          default("f")
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    :class_name =>"ShortenedURL",
    :foreign_key => :user_id,
    :primary_key => :id
    )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  # 1.minutes.ago

  has_many :visited_urls, :through => :visits, :source => :url
end
