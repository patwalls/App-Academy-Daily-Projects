require_relative 'questions_db'
require_relative 'user'
require_relative 'questions'

class Reply
  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      replies
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id(reply_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL
    raise "Reply does not exist" if data.empty?
    self.new(data[0])
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map { |datum| self.new(datum) }
  end

  def initialize(options)
    @id, @question_id, @parent_id, @user_id, @body =
      options.values_at('id', 'question_id', 'parent_id', 'user_id', 'body')
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

end

# id  INTEGER PRIMARY KEY NOT NULL,
# question_id INTEGER NOT NULL,
# parent_id INTEGER,
# user_id INTEGER NOT NULL,
# body TEXT NOT NULL
