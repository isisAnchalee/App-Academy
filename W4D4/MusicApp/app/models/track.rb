class Track < ActiveRecord::Base
	validates :title, presence: true, uniqueness: { scope: :album }
  validates :album, presence: true

	belongs_to :album
	has_one :band, through: :album, source: :band

	
end
