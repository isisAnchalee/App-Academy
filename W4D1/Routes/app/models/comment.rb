class Comment < ActiveRecord::Base
  belongs_to :c_ments, polymorphic: true

end
