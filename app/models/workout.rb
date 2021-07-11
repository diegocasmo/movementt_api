class Workout < ApplicationRecord
  include Sanitize
  strip_attributes :name

  # Associations
  belongs_to :user, inverse_of: :workouts
  has_many :exercises, inverse_of: :workout, dependent: :destroy, class_name: 'WorkoutExercise'
  accepts_nested_attributes_for :exercises

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
  validates :rounds_completed, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :elapsed_ms, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :started_at, presence: true
  validates :completed_at, presence: true
  validate :completed_at_is_feasible

  private

  def completed_at_is_feasible
    return if completed_at.blank? || started_at.blank?

    errors.add(:completed_at, 'must be greater than the start date') if completed_at <= started_at
  end
end
