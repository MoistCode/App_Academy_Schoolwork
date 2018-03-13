# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  mod_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :mod,
    class_name: :User,
    primary_key: :id,
    foreign_key: :mod_id

  has_many :subposts,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :sub_id

  has_many :posts,
    through: :subposts,
    source: :post
end
