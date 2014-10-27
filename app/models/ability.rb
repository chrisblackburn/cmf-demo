class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all

    can :approve, :all if user.approver?
  end
end
