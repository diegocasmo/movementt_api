class Api::V1::ExercisesController < ApplicationController
  before_action :set_exercise, only: [:update, :destroy]

  # @route GET /api/v1/exercises (api_v1_exercises)
  def index
    json_response(policy_scope(Exercise))
  end

  # @route POST /api/v1/exercises (api_v1_exercises)
  def create
    @exercise = current_user.exercises.new
    @exercise.assign_attributes(permitted_attributes(@exercise))

    authorize(@exercise)
    @exercise.save!

    json_response(@exercise)
  end

  # @route PATCH /api/v1/exercises/:id (api_v1_exercise)
  # @route PUT /api/v1/exercises/:id (api_v1_exercise)
  def update
    authorize(@exercise)

    @exercise.update!(permitted_attributes(@exercise))

    json_response(@exercise)
  end

  # @route DELETE /api/v1/exercises/:id (api_v1_exercise)
  def destroy
    authorize(@exercise)

    @exercise.destroy!

    json_response(nil, :no_content)
  end

  private

  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end
end
