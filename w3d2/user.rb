require_relative 'questions_db'
require_relative 'reply'
require_relative 'questions'
require_relative 'question_follows'

class User

  attr_accessor :id, :f_name, :l_name

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      users
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
      SQL
      raise "id does not exist" if data.empty?
      self.new(data[0])
  end

  def self.find_by_name(f_name, l_name)
    data = QuestionsDatabase.instance.execute(<<-SQL, f_name, l_name)
      SELECT
        *
      FROM
        users
      WHERE
        users.f_name = ? AND users.l_name = ?
      SQL
      raise "name does not exist" if data.empty?
      data.map { |datum| self.new(datum) }
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        COUNT(DISTINCT question_likes.user_id) /
        COUNT(DISTINCT question_likes.question_id)
      FROM
        questions
      JOIN question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?
    SQL
    data[0].values[0]
  end

  def save
    raise "self already in DB" if @id
    QuestionsDatabase.instance.execute(<<-SQL)
      INSERT INTO
        users(f_name, l_name)
      VALUES
        ('#{f_name}', '#{l_name}')
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "self not in DB" unless @id

    QuestionsDatabase.instance.execute(<<-SQL, @f_name, @l_name, @id)
      UPDATE
        users
      SET
        f_name = ?, l_name = ?
      WHERE
        id = ?
    SQL
  end

  def initialize(options)
    @id, @f_name, @l_name = options.values_at('id', 'f_name', 'l_name')
  end

end
