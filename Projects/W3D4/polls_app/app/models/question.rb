# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  poll_question :text
#  poll_id       :integer
#

class Question < ApplicationRecord
  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll,
    optional: true

  has_many :answers,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
end
