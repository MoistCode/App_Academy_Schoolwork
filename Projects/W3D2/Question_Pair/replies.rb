require_relative 'questions'

class Replies

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
  end

  def self.find_by_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
  end

  def self.find_by_question_id(id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
