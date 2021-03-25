module MovementType
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    enum movement_type: {
      core: 0,
      full_body: 1,
      hinge: 2,
      pull: 3,
      push: 4,
      squat: 5,
      other: 6
    }

    validates :movement_type, inclusion: { in: movement_types.keys }
  end
end
