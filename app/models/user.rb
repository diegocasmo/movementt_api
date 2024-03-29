class User < ApplicationRecord
  include Sanitize
  strip_attributes :email, :uid

  # Associations
  has_many :workouts, inverse_of: :user, dependent: :destroy
  has_many :workout_exercises, :through => :workouts, source: :exercises
  has_many :routines, inverse_of: :user, dependent: :destroy
  has_many :routine_exercises, :through => :routines, source: :exercises
  has_many :exercises, inverse_of: :user, dependent: :destroy

  enum weight_unit_type: {
    metric: 0,
    imperial: 1
  }, _prefix: :weight_unit_type

  enum distance_unit_type: {
    metric: 0,
    imperial: 1
  }, _prefix: :distance_unit_type

  # Validations
  validates :uid, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :weight_unit_type, inclusion: { in: weight_unit_types.keys }, allow_nil: true
  validates :distance_unit_type, inclusion: { in: distance_unit_types.keys }, allow_nil: true
end
