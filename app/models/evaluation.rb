class Evaluation < ApplicationRecord
  belongs_to :mood_element
  belongs_to :user

  validates :evaluation, presence: true
end
