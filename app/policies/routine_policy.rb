class RoutinePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user &&
      record.exercises.all? { |x| RoutineExercisePolicy.new(user, x).update? }
  end

  def destroy?
    record.user == user &&
      record.exercises.all? { |x| RoutineExercisePolicy.new(user, x).destroy? }
  end

  def permitted_attributes_for_create
    [
      :name,
      :rounds,
      :rest_ms,
      exercises_attributes: [
        :name,
        :category_type,
        :movement_type,
        :weight_unit_type,
        :distance_unit_type,
        :quantity,
        :weight,
        :rest_ms,
        :position
      ]
    ]
  end

  def permitted_attributes_for_update
    [
      :name,
      :rounds,
      :rest_ms,
      exercises_attributes: [
        :id,
        :name,
        :category_type,
        :movement_type,
        :weight_unit_type,
        :distance_unit_type,
        :quantity,
        :weight,
        :rest_ms,
        :position,
        :_destroy
      ]
    ]
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
