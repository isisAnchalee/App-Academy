class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :band_id }
  validates :recording_type, inclusion: { in: %w(live, studio) }
  validates :band, presence: true

  belongs_to :band, inverse_of: :albums
  has_many :tracks, dependent: :destroy

  
end
