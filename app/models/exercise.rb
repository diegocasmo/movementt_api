class Exercise < ApplicationRecord
  # Associations
  belongs_to :user, inverse_of: :exercises

  enum movement_type: {
    core: 0,
    full_body: 1,
    hinge: 2,
    pull: 3,
    push: 4,
    squat: 5,
    other: 6,
  }

  # Validations
  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :movement_type, inclusion: { in: movement_types.keys }
end
