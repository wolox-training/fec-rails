
class RentPolicy < ApplicationPolicy

  def initialize(user, rent)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user   = user
    @rent = rent
  end

  #using pundit scopes to make easier code reading and save lines.
  #based on Scopes examples from pundit documentation.
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
