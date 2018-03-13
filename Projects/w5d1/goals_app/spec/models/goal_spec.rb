# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  goal       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:goal) }
  it { should validate_presence_of(:user).with_message(:required) }
  it { should have_many(:comments) }
end
