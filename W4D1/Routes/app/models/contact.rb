class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, :uniqueness => {:scope => :user_id}
  has_many :comments, as: :c_ments

  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :shared_users,
    class_name: "ContactShare",
    foreign_key: :contact_id,
    primary_key: :id
  )
end
