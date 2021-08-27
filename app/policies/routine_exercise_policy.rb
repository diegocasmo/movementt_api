class RoutineExercisePolicy < ApplicationPolicy
  def create?
    record.user == user &&
      user.verified?
  end

  def update?
    record.user == user &&
      user.verified?
  end

  def destroy?
    record.user == user &&
      user.verified?
  end
end
