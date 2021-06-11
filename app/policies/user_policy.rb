class UserPolicy < ApplicationPolicy
  def update?
    record == user
  end

  def verify?
    record == user
  end

  def permitted_attributes_for_update
    []
  end
end
