class UserPolicy < ApplicationPolicy
  def update?
    record == user
  end

  def permitted_attributes_for_update
    [:weight_unit_type, :distance_unit_type]
  end
end
