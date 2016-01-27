# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Response < ActiveRecord::Base
  validates :id, uniqueness: true
  validates :answer_choice, presence: true
  validates :user, presence: true
  validate :respondent_already_answered?
  validate :respondent_is_author?


  belongs_to :answer_choice
  belongs_to :user

  has_one :author,
    through: :answer_choice,
    source: :author

  has_one :question,
    through: :answer_choice,
    source: :question

  def not_duplicate_response

  end

  def sibling_responses
    self.question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    if sibling_responses.where(user_id: user_id).count > 0
      errors[:user_id] << "Respondent can't respond more than once."
    end

    def respondent_is_author?
      if self.user_id == author.id
        errors[:user_id] << "Author cannot respond to own question."
      end
    end
  end
end
