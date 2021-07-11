class RoutineExercise < ApplicationRecord
  include MovementType
  include CategoryType
  include WeightUnitType
  include Sanitize
  strip_attributes :name

  # Associations
  belongs_to :routine, inverse_of: :exercises
  has_one :user, through: :routine

  # Validations
  validates :routine, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :quantity, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :weight, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  validates :rest_seconds, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :position, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
end
