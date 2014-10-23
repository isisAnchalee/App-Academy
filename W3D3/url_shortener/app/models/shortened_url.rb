require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  
  validates :short_url, :presence => true, :uniqueness => true
    
  belongs_to(
  :user,
  :class_name => 'User',
  :foreign_key => :submitter_id,
  :primary_key => :id
  )
  
  belongs_to(
  :submitter,
  :class_name => 'User',
  :foreign_key => :submitter_id,
  :primary_key => :id
  )
  
  has_many(
  :visits,
  :class_name => 'Visit',
  :foreign_key => :shortened_url_id,
  :primary_key => :id
  )
  
  has_many :visitors, Proc.new { distinct }, :through => :visits, :source => :visitor
  
  
  def self.random_code
    code = SecureRandom.urlsafe_base64[0...16]
    while ShortenedUrl.where('short_url = ?', code).exists?
      code = SecureRandom.urlsafe_base64[0...16]
    end
    code
  end
  
  def self.create_for_user_and_long_url!(long_url, user)
    
    format_hash ={
      long_url: long_url,
      submitter_id: user.id,
      short_url: ShortenedUrl.random_code
    }
    
    ShortenedUrl.create!(format_hash)
  end
  
  def num_clicks
    self.visits.count
  end
  
  def num_uniques
    self.visits.select(:user_id).count
  end
  
  def num_recent_uniques
    get_recent = Visit.where('created_at > ?', 10.minutes.ago).count
  end


end