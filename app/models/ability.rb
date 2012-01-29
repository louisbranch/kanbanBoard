class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :create, Project
    can [:read, :update, :destroy], Project do |project|
      project.member?(user)
    end

    can :create, UserStory
    can [:read, :update, :destroy, :update_status], UserStory do |user_story|
      user_story.project.member?(user)
    end

    can :create, Issue
    can [:read, :update, :destroy], Issue do |issue|
      issue.user_story.project.member?(user)
    end

  end
end
