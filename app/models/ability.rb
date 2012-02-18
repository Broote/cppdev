class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest

    if user.role=="admin"
      can :manage, :all
    elsif user.role=="student"
      can :read, [Post, Comment, Problem, User]
      can :create, [Post, Comment, Solution]
      can :update, [User, Comment, Post] do |comment|
        comment.try(:user) == user
      end
    else
      can :read, [Post, Problem, Comment]
    end
  end
end