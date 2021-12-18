class RoutineExercise < ApplicationRecord
  include Exercisable

  # Associations
  belongs_to :routine, inverse_of: :exercises
  has_one :user, through: :routine

  # Validations
  validates :routine, presence: true

  # Scopes
  scope :weighted, -> { where('weight > 0')  }
end
