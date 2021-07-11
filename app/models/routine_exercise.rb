class RoutineExercise < ApplicationRecord
  include Exercisable

  # Associations
  belongs_to :routine, inverse_of: :exercises
  has_one :user, through: :routine

  # Validations
  validates :routine, presence: true
end
