# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  url_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ActiveRecord::Base
  belongs_to(
    :url,
    class_name: "ShortenedURL",
    foreign_key: :url_id,
    primary_key: :id
  )

  belongs_to(
    :tag,
    class_name: "TagTopic",
    foreign_key: :tag_id,
    primary_key: :id
  )

  def self.record_tag!(url, tag_topic)
    self.create!(url: url, tag: tag_topic)
  end

end
