module UserService
  class Update < ApplicationService
    def initialize(user:, weight_unit_type:, distance_unit_type:)
      @user = user
      @weight_unit_type = weight_unit_type
      @distance_unit_type= distance_unit_type
    end

    def call
      ActiveRecord::Base.transaction do
        @user.update!(
          weight_unit_type: @weight_unit_type,
          distance_unit_type: @distance_unit_type
        )

        if @user.weight_unit_type_previously_changed?
          UserService::MigrateWeightUnitType.call(
            user: @user,
            weight_unit_type: @weight_unit_type
          )
        end

        if @user.distance_unit_type_previously_changed?
          UserService::MigrateDistanceUnitType.call(
            user: @user,
            distance_unit_type: @distance_unit_type
          )
        end
      end
    end
  end
end
