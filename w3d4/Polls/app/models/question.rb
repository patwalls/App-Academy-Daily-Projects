# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :id, uniqueness: true
  validates :text, presence: true
  validates :poll, presence: true

  has_many :answer_choices
  belongs_to :poll

  has_one :author,
    through: :poll,
    source: :author

  has_many :responses,
    through: :answer_choices,
    source: :responses

    def res
      AnswerChoice.find_by_sql([<<-SQL, self.id])
      SELECT
        answer_choices.text, COUNT(responses.id) as resp_count
      FROM
        answer_choices
      LEFT OUTER JOIN
        responses ON answer_choices.id = responses.answer_choice_id
      WHERE
        answer_choices.question_id = ?
      GROUP BY
        answer_choices.id
      SQL
    end

    def results
      answers = Hash.new { |k,v| k[v] = 0 }

      self.answer_choices.includes(:responses).each do |answer_choice|
        answers[answer_choice.text] += answer_choice.responses.length
      end
      answers
    end

end


# SELECT
#   COUNT(*)
# FROM
#   questions
# WHERE
#   questions.id = ?
# JOIN
#   answer_choices ON questions.id = answer_choices.question_id
# JOIN
#   responses ON answer_choices.id = responses.answer_choice_id
# GROUP BY
#   answer_choice.id
# SQL
