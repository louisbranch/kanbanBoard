class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :create, Project
    can :read, Project do |project|
      project.member?(user)
    end
    can :update, Project do |project|
      project.member?(user)
    end
    can :destroy, Project do |project|
      project.member?(user)
    end

    can :create, UserStory
    can :read, UserStory do |user_story|
      user_story.project.member?(user)
    end
    can :update, UserStory do |user_story|
      user_story.project.member?(user)
    end
    can :destroy, UserStory do |user_story|
      user_story.project.member?(user)
    end
    can :update_status, UserStory do |user_story|
      user_story.project.member?(user)
    end

  end
end

