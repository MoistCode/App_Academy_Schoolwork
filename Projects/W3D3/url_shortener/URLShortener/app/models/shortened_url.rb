require 'securerandom'

class ShortenedUrl < ApplicationRecord

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :visitors,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitor_ids,
    through: :visitors,
    source: :visitor


  def self.random_code
    random_code = SecureRandom.urlsafe_base64

    until !ShortenedUrl.exists?(:short_url => random_code)
      random_code = SecureRandom.urlsafe_base64
    end

    random_code
  end

  def self.create_with_user(user, long_url)
    random = ShortenedUrl.random_code
    ShortenedUrl.create(long_url: long_url, short_url: random, user_id: user.id)
  end

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.visitor_ids.uniq.count
  end

  def num_recent_uniques
    self.visitor_ids.uniq.select do |visitor|
      visitor if (Time.now.utc - visitor.created_at) <= 600
    end
  end

end
