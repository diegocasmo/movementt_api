class Exercise < ApplicationRecord
  include MovementType
  include Sanitize
  strip_attributes :name

  # Associations
  belongs_to :user, inverse_of: :exercises

  # Validations
  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
