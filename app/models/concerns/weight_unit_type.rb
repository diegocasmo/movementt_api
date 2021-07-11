module WeightUnitType
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    enum weight_unit_type: {
      metric: 0,
      imperial: 1
    }

    validates :weight_unit_type, inclusion: { in: weight_unit_types.keys }
  end
end
