class Cat < ActiveRecord::Base
  GENDERS = ["M", "F"]
  
  validates :birth, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: GENDERS
  has_many :cat_rental_requests, :dependent => :destroy
  #validates :birth <= Time.now
  
end
