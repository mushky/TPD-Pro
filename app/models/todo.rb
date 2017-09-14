class Todo < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  self.per_page = 50

end
