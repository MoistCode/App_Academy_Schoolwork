require_relative 'questions'

class Replies

  attr_accessor :id, :body, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    data.map { |datum| Replies.new(datum) }
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
    data.map { |datum| Replies.new(datum) }
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
    data.map { |datum| Replies.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def author(reply_id)
    # Find the author of the reply id
    
  end

  def question(reply_id)
    # Find the question based on the reply id
  end

  def parent_reply
    # Find replies where parent key is null
  end

  def child_replies
    # Find replies where there parent key is not null
  end

end
