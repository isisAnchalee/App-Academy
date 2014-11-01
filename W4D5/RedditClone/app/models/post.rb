class Post < ActiveRecord::Base
  validates :content, :sub_id, :user_id, :title, presence: true
  belongs_to :user
  has_many :post_subs
  has_many :subs, through: :post_subs, source: :sub
end