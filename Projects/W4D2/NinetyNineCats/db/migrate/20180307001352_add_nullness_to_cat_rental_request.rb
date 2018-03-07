class AddNullnessToCatRentalRequest < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cat_rental_requests, :status, false
  end
end
