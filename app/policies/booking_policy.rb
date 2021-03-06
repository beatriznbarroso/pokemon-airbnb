class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_user?
  end

  def destroy?
    is_user?
  end

  private 

  def is_user?
    record.user == user
  end
end
