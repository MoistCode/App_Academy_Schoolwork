# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :valid_request?

  def valid_request?
    request = CatRentalRequest.where(cat_id: self.cat_id).to_a
    return true if request.nil?
    debugger
    request.each do |req|
      if self.start_date.between?(req.start_date, req.end_date)
        errors[:request] << "Date invalid"
      end
    end

    true
  end

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id

end
