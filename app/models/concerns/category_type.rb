module CategoryType
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    enum category_type: {
      reps: 0,
      time: 1,
      distance: 2
    }

    validates :category_type, inclusion: { in: category_types.keys }
  end
end
