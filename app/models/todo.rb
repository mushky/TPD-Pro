class Todo < ApplicationRecord
  belongs_to :user, optional: true

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: nil) }

  def mark_complete!
    self.update_attribute(:complete, true)
  end

end
