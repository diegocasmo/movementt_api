class User < ApplicationRecord
  # Associations
  has_many :routines, inverse_of: :user, dependent: :destroy
  has_many :exercises, inverse_of: :user, dependent: :destroy

  # Validations
  validates :uid, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :verified, inclusion: { in: [true, false] }

  # Scopes
  scope :verified, -> { where(verified: true)  }
  scope :unverified, -> { where(verified: false)  }
end
