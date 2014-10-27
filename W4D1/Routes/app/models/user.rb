class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :contacts
  has_many(
      :shared_contacts,
      class_name: "ContactShare",
      foreign_key: :user_id,
      primary_key: :id
    )

end
