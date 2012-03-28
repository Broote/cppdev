class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest

    if user.role=="admin"
      can :manage, :all
    elsif user.role=="student"
      can :read, [Post, Comment, Problem, User]
      can :create, [Post, Comment, Solution]
      can [:update, :destroy], [Comment, Post], :user_id => user.id
      can [:update, :destroy], User, :id => user.id
      can :manage, Solution, :user_id => user.id
      cannot [:all, :verified, :unverified], Solution # if false
      cannot :index, Solution
    else
      can :read, [User, Post, Problem, Comment]
    end
  end
end