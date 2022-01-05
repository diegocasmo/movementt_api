class WorkoutPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    record.user == user &&
      user.verified?
  end

  def permitted_attributes_for_create
    [
      :name,
      :rounds,
      :rest_ms,
      :rounds_completed,
      :elapsed_ms,
      :started_at,
      :completed_at,
      exercises_attributes: [
        :name,
        :category_type,
        :movement_type,
        :weight_unit_type,
        :distance_unit_type,
        :quantity,
        :weight,
        :rest_ms,
      ]
    ]
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
