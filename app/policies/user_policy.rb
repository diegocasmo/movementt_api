class UserPolicy < ApplicationPolicy
  def update?
    record == user &&
      user.verified.present?
  end

  def verify?
    record == user
  end

  def permitted_attributes_for_update
    []
  end
end
