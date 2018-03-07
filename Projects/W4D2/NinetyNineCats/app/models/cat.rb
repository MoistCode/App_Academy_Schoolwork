# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :description, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F) }

  def age
    (Date.today - birth_date).to_i
  end

  has_many :requests,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id,
    dependent: :destroy

end
