# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Commentary, published: true

    return unless user.present?

    can [:read, :update, :create, :destroy], Member, user: user
    can [:read, :update, :create, :destroy], Commentary, user: user

    return unless user.admin?

    can :manage, :all
  end
end
