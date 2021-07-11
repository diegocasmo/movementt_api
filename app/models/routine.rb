class Routine < ApplicationRecord
  include Sanitize
  strip_attributes :name

  # Associations
  belongs_to :user, inverse_of: :routines
  has_many :exercises, inverse_of: :routine, dependent: :destroy, class_name: 'RoutineExercise'
  accepts_nested_attributes_for :exercises, allow_destroy: true

  # Validations
  validates :user, presence: true
  validates :exercises, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :rounds, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :rest_seconds, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
end
