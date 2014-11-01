class Post < ActiveRecord::Base
  validates :content, :user, :title, presence: true
  belongs_to :user
  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub
end