class Api::V1::RoutinesController < ApplicationController
  before_action :set_routine, only: [:update, :destroy]

  # @route GET /api/v1/routines (api_v1_routines)
  def index
    json_response(policy_scope(Routine))
  end

  # @route POST /api/v1/routines (api_v1_routines)
  def create
    @routine = current_user.routines.new
    @routine.assign_attributes(permitted_attributes(@routine))

    authorize(@routine)
    @routine.save!

    json_response(@routine)
  end

  # @route PATCH /api/v1/routines/:id (api_v1_routine)
  # @route PUT /api/v1/routines/:id (api_v1_routine)
  def update
    authorize(@routine)

    @routine.update!(permitted_attributes(@routine))

    json_response(@routine)
  end

  # @route DELETE /api/v1/routines/:id (api_v1_routine)
  def destroy
    authorize(@routine)

    @routine.destroy!

    json_response(nil, :no_content)
  end

  private

  def set_routine
    @routine = current_user.routines.find(params[:id])
  end
end
