# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Commentary, published: true

    if user.role.name == "Administrator"
      can :manage, :all
    elsif user.role.name == "Regular"
      can [:read, :update, :create, :destroy], Commentary, user: user
    else
      can [:read], Commentary
    end
  end
end
