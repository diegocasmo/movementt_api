class WorkoutExercisePolicy < ApplicationPolicy
  def create?
    record.user == user
  end
end
