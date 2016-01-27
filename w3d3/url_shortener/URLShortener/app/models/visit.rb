# == Schema Information
#
# Table name: visits
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  shorturl_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Visit < ActiveRecord::Base
  belongs_to(
    :visitor,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
    )

  belongs_to(
    :url,
    class_name: "ShortenedURL",
    foreign_key: :shorturl_id,
    primary_key: :id
  )

  def self.record_visit!(user, shortened_url)
    self.create!(visitor: user, url: shortened_url)
  end
end
