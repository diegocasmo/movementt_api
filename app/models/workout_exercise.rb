class WorkoutExercise < ApplicationRecord
  include Exercisable

  # Associations
  belongs_to :workout, inverse_of: :exercises
  has_one :user, through: :workout

  # Validations
  validates :workout, presence: true
end
