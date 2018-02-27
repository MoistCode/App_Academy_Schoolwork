require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'replies'
require_relative 'question_likes'
require_relative 'question_follows'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions

  attr_accessor :id, :title, :body, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM questions')
    data.map { |datum| Questions.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author(question_id)
    # Find the author's first and last name based on question ID
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.fname, users.lname
      FROM
        questions
      JOIN
        users
        ON questions.user_id = users.id
      WHERE
        id = ?
    SQL
    data.map { |datum| Questions.new(datum) }
  end

  def replies(question_id)
    # Find the replies based on the question ID
    Replies.find_by_question_id(question_id)
  end

  def followers(question_id)
    # Find all follows of a certain question
    QuestionFollowers.followers_for_question_id(question_id)
  end

end
