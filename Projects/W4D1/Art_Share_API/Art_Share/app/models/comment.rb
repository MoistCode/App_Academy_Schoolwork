# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  commenter_id :integer          not null
#  comment_body :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  artwork_id   :integer
#

class Comment < ApplicationRecord
  validates :commenter_id, presence: true

  belongs_to :commenter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :commenter_id

  belongs_to :artwork,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artwork_id

end
