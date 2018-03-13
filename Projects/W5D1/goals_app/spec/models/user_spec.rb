# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:comments) }
  it { should have_many(:goals) }


  describe 'User::find_by_credentials' do
    context 'invalid user' do
      it 'should return nil if user doesn\'t exist' do
        expect(User.find_by_credentials('moistie', 'moist')).to be_nil
      end
    end

    context 'valid user' do
      it 'should return correct user' do
        User.destroy_all
        User.create!(username: 'moistie', password: 'password')
        user = User.find_by(username: 'moistie')
        expect(User.find_by_credentials('moistie', 'password')).to eq(user)
      end
    end
  end



end
