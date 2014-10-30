class Album < ActiveRecord::Base
  validates :album_name, presence: true
  validates :album_name, uniqueness: { scope: :band_id }
  validates :recording_type, inclusion: { in: %w(Live Studio) }
  validates :band, presence: true

  belongs_to :band, inverse_of: :albums
  has_many :tracks, dependent: :destroy

  
end
