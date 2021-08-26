class Task < ApplicationRecord
  validates :title, :deadline, presence: true

end
