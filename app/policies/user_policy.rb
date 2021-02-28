class UserPolicy < ApplicationPolicy
  def update?
    record == user
  end

  def permitted_attributes_for_update
    [:verified]
  end
end
