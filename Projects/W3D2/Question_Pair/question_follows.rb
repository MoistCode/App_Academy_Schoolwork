require_relative 'questions'

class QuestionFollowers

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
    data.map { |datum| QuestionFollowers.new(datum) }
  end

  def self.find_by_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL
  end

  def self.find_by_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
