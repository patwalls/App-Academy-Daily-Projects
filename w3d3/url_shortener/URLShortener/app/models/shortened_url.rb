class ShortenedURL < ActiveRecord::Base
  # include ActiveModel::Validations
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, length: { maximum: 1024 }
  validate :check_spam?
  validate :premium?

  belongs_to :submitter,
      class_name: "User",
      foreign_key: :user_id,
      primary_key: :id

  has_many :visits,
    class_name: "Visit",
    foreign_key: :shorturl_id,
    primary_key: :id

  has_many :taggings,
    class_name: "Tagging",
    foreign_key: :url_id,
    primary_key: :id

  has_many :tags, :through => :taggings, :source => :tag

  has_many :visitors, Proc.new { distinct }, :through => :visits, :source => :visitor

  def self.random_code
    url = SecureRandom.urlsafe_base64(16,false)
    while exists?({short_url: url})
      url = SecureRandom.urlsafe_base64(16,false)
    end
    url
  end

  def num_clicks
    Visit.where(shorturl_id: self.id).count
  end

  def num_uniques
    # Visit.where(shorturl_id: self.id).distinct.count(:user_id)
    visitors.count
  end

  def num_recent_uniques
    Visit.where(shorturl_id: self.id, created_at: (10.minutes.ago..Time.now)).distinct.count(:user_id)
  end


  def check_spam?
    recent_submissions = ShortenedURL.where(submitter: self.submitter, created_at: (1.minutes.ago..Time.now))
    if recent_submissions.count > 5
      errors[:spam] << "Too many submissions"
    end
  end

  def premium?
    all_submissions = ShortenedURL.where(submitter: self.submitter)
    if all_submissions.count >= 5 && !self.submitter.premium
      errors[:premium] << "you must be a premium user to submit more than 5 links"
    end
  end

  def self.create_for_user_and_long_url!(user,long_url)
    self.create!(submitter: user, long_url: long_url, short_url: random_code)
  end

end


# class SpamValidator < ActiveModel::Validations
#   def validate(url)
#     true unless ShortenedURL.check_spam?(url.user)
#   end
# end
