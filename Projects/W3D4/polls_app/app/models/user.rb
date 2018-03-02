# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#

class User < ApplicationRecord

  has_many :author_polls,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Poll


  has_many :author_reponses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Response
end
