module Exercisable
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    include MovementType
    include Sanitize
    strip_attributes :name

    enum category_type: {
      reps: 0,
      time: 1,
      distance: 2
    }, _prefix: :category_type

    enum weight_unit_type: {
      metric: 0,
      imperial: 1
    }, _prefix: :weight_unit_type

    enum distance_unit_type: {
      metric: 0,
      imperial: 1
    }, _prefix: :distance_unit_type

    validates :category_type, inclusion: { in: category_types.keys }
    validates :weight_unit_type, inclusion: { in: weight_unit_types.keys }
    validates :distance_unit_type, inclusion: { in: distance_unit_types.keys }
    validates :name, presence: true, length: { maximum: 255 }
    validates :quantity, presence: true, numericality: {
      greater_than: 0
    }
    validates :weight, presence: true, numericality: {
      greater_than_or_equal_to: 0
    }
    validates :rest_ms, presence: true, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  end
end
