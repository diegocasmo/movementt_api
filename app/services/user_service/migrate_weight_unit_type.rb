module UserService
  class MigrateWeightUnitType < ApplicationService
    def initialize(user:, weight_unit_type:)
      @user = user
      @weight_unit_type = weight_unit_type
    end

    def call
      @user
        .routine_exercises
        .weighted
        .where.not(weight_unit_type: @weight_unit_type)
        .each { |x| transform_weight_unit_type(x, @weight_unit_type) }
    end

    private

    def transform_weight_unit_type(exercise, next_weight_unit_type)
      exercise.update!(
        weight_unit_type: next_weight_unit_type,
        weight: if exercise.weight_unit_type_metric?
          kg_to_lb(exercise.weight)
        else
          lb_to_kg(exercise.weight)
        end
      )
    end

    def lb_to_kg(lb)
      (lb * 0.45359237).round(1)
    end

    def kg_to_lb(kg)
      (kg / 0.45359237).round(1)
    end
  end
end
