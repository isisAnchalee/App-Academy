class Cat < ActiveRecord::Base
  GENDERS = ["M", "F"]
  
  validates :birth, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: GENDERS
  has_many :cat_rental_requests, :dependent => :destroy
  
  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
  
  #validates :birth <= Time.now
  
end
