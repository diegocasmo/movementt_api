class UserPolicy < ApplicationPolicy
  def update?
    record == user &&
      user.verified?
  end

  def verify?
    record == user
  end

  def permitted_attributes_for_update
    [:weight_unit_type, :distance_unit_type]
  end
end
