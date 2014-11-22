class WikiPolicy < ApplicationPolicy
  
  def new?
    true
  end

  def show?
    record.public? || user.present
  end

  def destroy?
    user.present? || (record.user == user || user.role?(:admin))

end