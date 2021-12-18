class WorkoutExercise < ApplicationRecord
  include Exercisable

  # Associations
  belongs_to :workout, inverse_of: :exercises
  has_one :user, through: :workout

  # Validations
  validates :workout, presence: true

  # Scopes
  scope :weighted, -> { where('weight > 0')  }
end
