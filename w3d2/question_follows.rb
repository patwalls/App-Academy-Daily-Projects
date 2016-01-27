require_relative 'questions_db'
require_relative 'reply'
require_relative 'questions'
require_relative 'user'

class QuestionFollow
  attr_accessor :id, :question_id, :follower_id

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      question_follows
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id(questionfollow_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, questionfollow_id)
    SELECT
      *
    FROM
      question_follows
    WHERE
      id = ?
    SQL
    raise "question follow does not exist" if data.empty?
    self.new(data[0])
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.follower_id
      WHERE
        question_follows.question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.follower_id = ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions ON question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT ?
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id, @question_id, @follower_id =
      options.values_at('id', 'question_id', 'follower_id')
  end
end
