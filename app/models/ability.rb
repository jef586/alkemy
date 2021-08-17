# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.regular?
      can [:create, :update, :destroy], Commentary, user: user
      can [:read], Commentary
      can [:create], Contact
    else
      can :read, Commentary, published: true
    end
  end
end
