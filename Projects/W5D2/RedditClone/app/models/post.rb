# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id

  has_many :postsubs,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :post_id

  has_many :subs,
    through: :postsubs,
    source: :sub

  has_many :comments
end
