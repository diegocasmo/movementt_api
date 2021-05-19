class ExercisePolicy < ApplicationPolicy
  def index?
    true
  end

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

  def permitted_attributes_for_create
    [:name, :movement_type]
  end

  def permitted_attributes_for_update
    [:name, :movement_type]
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
