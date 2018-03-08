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
  validates :title, :year, :band_id, presence: true
end
