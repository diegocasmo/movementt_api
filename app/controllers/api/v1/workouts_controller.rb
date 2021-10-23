class Api::V1::WorkoutsController < ApplicationController
  # @route GET /api/v1/workouts (api_v1_workouts)
  def index
    json_response(
      policy_scope(Workout).paginated_history(params[:page])
    )
  end

  # @route POST /api/v1/workouts (api_v1_workouts)
  def create
    @workout = current_user.workouts.new
    @workout.assign_attributes(permitted_attributes(@workout))

    authorize(@workout)
    @workout.save!

    json_response(@workout)
  end
end
