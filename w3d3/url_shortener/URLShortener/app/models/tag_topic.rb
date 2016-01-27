# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base
  has_many :taggings,
    class_name: "Tagging",
    foreign_key: :tag_id,
    primary_key: :id

  has_many :urls, :through => :taggings, :source => :url
end
