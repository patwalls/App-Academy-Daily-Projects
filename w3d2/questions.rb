require_relative 'questions_db'
require_relative 'reply'
require_relative 'user'
require_relative 'question_follows.rb'

class Question
  attr_accessor :id, :title, :body, :author_id
  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
    SQL
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    raise "question id does not exist" if data.empty?
    self.new(data[0])
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    raise "author has no questions" if data.empty?
    data.map { |datum| self.new(datum) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def save
    raise "id already exists" if @id
    QuestionsDatabase.instance.execute(<<-SQL)
    INSERT INTO
      questions (title, body, author_id)
    VALUES
      ('#{title}', '#{body}', #{author_id})
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "id does not exist" unless @id
    QuestionsDatabase.instance.execute(<<-SQL, title, body, author_id, id)
    UPDATE
      questions
    SET
      title = ?, body = ?, author_id = ?
    WHERE
      id = ?
    SQL
  end

  def initialize(options)
    @id, @title, @body, @author_id =
      options.values_at('id', 'title', 'body', 'author_id')
  end

  def author
    User.find_by_id(self.author_id)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  def followers
    QuestionFollow.followers_for_question_id(self.id)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end

  def self.most_likes(n)
    QuestionLike.most_liked_questions(n)
  end

end
