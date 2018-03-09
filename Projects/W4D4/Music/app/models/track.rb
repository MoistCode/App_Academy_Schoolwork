# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, presence: true

  belongs_to :album,
    class_name: :Album,
    primary_key: :id,
    foreign_key: :album_id
end
