class Comment < ActiveRecord::Base
  validates :author_id, :body, presence: true

  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: 'Contact'

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User'
end
