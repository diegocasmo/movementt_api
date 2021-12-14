class User < ApplicationRecord
  include Sanitize
  strip_attributes :email, :uid

  # Associations
  has_many :workouts, inverse_of: :user, dependent: :destroy
  has_many :routines, inverse_of: :user, dependent: :destroy
  has_many :exercises, inverse_of: :user, dependent: :destroy

  enum system_of_measurement: {
    metric: 0,
    imperial: 1
  }

  # Validations
  validates :uid, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :verified, inclusion: { in: [true, false] }
  validates :weight_unit_type, inclusion: { in: system_of_measurements.keys }
  validates :distance_unit_type, inclusion: { in: system_of_measurements.keys }

  # Scopes
  scope :verified, -> { where(verified: true)  }
  scope :unverified, -> { where(verified: false)  }

  def verified?
    verified.present?
  end
end
