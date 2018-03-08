# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presnece: true
  validates :password, presnece: { minimum: 6, allow_nil: true }
  after_initialization: :ensure_session_token

  def password=(password)
    @password = password
    BC
  end

  private

  def ensure_session_token

  end
end
