# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    dependent: :destroy

  has_many :viewers,
    class_name: :ArtworkShare,
    primary_key: :id,
    foreign_key: :viewer_id

  has_many :shared_artworks,
    through: :viewers,
    source: :artwork,
    dependent: :destroy

  has_many :artwork_viewers,
    through: :artworks,
    source: :shared_viewers

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :commenter_id
end
