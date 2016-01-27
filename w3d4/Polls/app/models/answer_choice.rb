# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  text        :string           not null
#  question_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :id, uniqueness: true
  validates :text, presence: true
  validates :question, presence: true

  belongs_to :question
  has_many :responses

  has_one :author,
    through: :question,
    source: :author

end
