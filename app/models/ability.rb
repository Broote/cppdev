class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest

    if user.role=="admin"
      can :manage, :all
    else
      can :read, [Post, Comment, Problem]
      can :create, [Comment, Solution]
      can :update, Comment do |comment|
        comment.try(:user) == user
      end
    end
  end
end