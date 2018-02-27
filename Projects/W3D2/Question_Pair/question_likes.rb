require_relative 'questions'

class QuestionLikes

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        user_id = ?
    SQL
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    data.map { |datum| QuestionLikes.new(datum) }
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
