class RoutineExercisePolicy < ApplicationPolicy
  def create?
    record.user == user &&
      user.verified.present?
  end

  def update?
    record.user == user &&
      user.verified.present?
  end

  def destroy?
    record.user == user &&
      user.verified.present?
  end
end
