require_relative 'questions'

class QuestionFollowers

  attr_accessor :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
    data.map { |datum| QuestionFollowers.new(datum) }
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.title
      FROM
        question_follows
      JOIN
        users
        ON question_follows.user_id = users.id
        questions
        ON questions_follows.question_id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL
    data.map { |datum| QuestionFollowers.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.fname, users.lname
      FROM
        question_follows
      JOIN
        users ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL
    data.map { |datum| QuestionFollowers.new(datum) }
  end

  def self.most_followed_question(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.title
      FROM
        question_follows
      JOIN
        questions
        ON questions.id = question_follows.question_id
      GROUP BY
        question_follows.question_id
      ORDER BY
        COUNT(question_follows.question_id)
      LIMIT 1
      OFFSET ?
    SQL
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end
