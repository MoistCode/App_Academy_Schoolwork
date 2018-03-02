# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#

class Response < ApplicationRecord
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User,
    optional: true

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice,
    optional: true
end
