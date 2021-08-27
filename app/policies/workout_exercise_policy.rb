class WorkoutExercisePolicy < ApplicationPolicy
  def create?
    record.user == user &&
      user.verified?
  end
end
