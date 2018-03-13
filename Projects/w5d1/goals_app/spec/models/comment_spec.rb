# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  goal_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user).with_message(:required) }
  it { should validate_presence_of(:goal).with_message(:required) }

end
