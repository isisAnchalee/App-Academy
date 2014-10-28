class Cat < ActiveRecord::Base
  GENDERS = ["M", "F"]
  
  validates :birth, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: GENDERS
  #validates :birth <= Time.now
  
end
