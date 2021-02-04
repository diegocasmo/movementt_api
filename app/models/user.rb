class User < ApplicationRecord
  # Validations
  validates :uid, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :verified, presence: true, inclusion: { in: [true, false] }

  # Scopes
  scope :verified, -> { where(verified: true)  }
  scope :unverified, -> { where(verified: false)  }
end
