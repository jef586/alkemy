# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role.name
      when "Administrator"
        can :manage, :all
      when "Regular"
        can [:create, :update, :destroy], Commentary, user: user
        can [:read], Commentary
      else
        can :read, Commentary, published: true
    end
  end
end
