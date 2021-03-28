class RoutineExercise < ApplicationRecord
  include MovementType
  include Sanitize
  strip_attributes :name

  # Associations
  belongs_to :routine, inverse_of: :exercises
  has_one :user, through: :routine

  enum category_type: {
    reps: 0,
    time: 1,
    distance: 2
  }

  enum weight_unit_type: {
    metric: 0,
    imperial: 1
  }

  # Validations
  validates :routine, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :category_type, inclusion: { in: category_types.keys }
  validates :weight_unit_type, inclusion: { in: weight_unit_types.keys }
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
