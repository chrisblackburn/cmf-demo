class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all

    cannot :approve, :all
    can :approve, :all if user.approver?
  end
end
