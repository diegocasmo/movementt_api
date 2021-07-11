class WorkoutExercisePolicy < ApplicationPolicy
  def create?
    record.user == user &&
      user.verified.present?
  end
end
