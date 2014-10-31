class Track < ActiveRecord::Base
	validates :track_name, presence: true, uniqueness: { scope: :album }
  validates :album, presence: true
  validates :track_type, inclusion: { in: %w(bonus regular) }
  
	belongs_to :album
	has_one :band, through: :album, source: :band

	
end
