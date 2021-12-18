module UserService
  class MigrateDistanceUnitType< ApplicationService
    def initialize(user:, distance_unit_type:)
      @user = user
      @distance_unit_type = distance_unit_type
    end

    def call
      @user
        .routine_exercises
        .category_type_distance
        .where.not(distance_unit_type: @distance_unit_type)
        .each { |x| migrate_distance_unit_type(x, @distance_unit_type)}
    end

    private

    def migrate_distance_unit_type(exercise, next_distance_unit_type)
      exercise.update(
        distance_unit_type: next_distance_unit_type,
        quantity: if exercise.distance_unit_type_metric?
          km_to_mi(exercise.quantity)
        else
          mi_to_km(exercise.quantity)
        end
      )
    end

    def km_to_mi(km)
      (km * 0.621371).round(1)
    end

    def mi_to_km(mi)
      (mi / 0.621371).round(1)
    end

  end
end
