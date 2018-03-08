# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  year    :integer          not null
#  status  :string           not null
#  band_id :integer
#

class Album < ApplicationRecord
  ALBUM_STATUS = ["LIVE", "STUDIO"]
  validates :title, :year, :band_id, presence: true
  validates :status, inclusion: { in: ALBUM_STATUS, message: "Invalid album status" }

  belongs_to :band,
    class_name: :Band,
    primary_key: :id,
    foreign_key: :band_id
    
end
