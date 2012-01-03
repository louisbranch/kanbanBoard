require 'spec_helper'
require "cancan/matchers"

describe User do

  it 'searchs for an email' do
  	user = Factory(:user, :email => 'artfikan@gmail.com')
		User.search('artfikan@gmail.com').should include(user)
  end

  it 'raises an error for invalid email format' do
    expect { User.search('artfikangmail.com')}.should raise_error
  end

  it 'returns a list of invitations for its email' do
    invitation = Factory(:invitation, :email => 'artfikan@gmail.com')
    user = Factory(:user, :email => 'artfikan@gmail.com')
    user.invitations.should include(invitation)
  end

  context 'project authorization' do

    before(:each) do
      @project = Factory(:project)
      @user = Factory(:user)
      @project.users << @user
      @ability = Ability.new(@user)
    end

    it 'can create a project' do
      @ability.should be_able_to(:create, Project)
    end

    it 'can view its own projects' do
      @ability.should be_able_to(:read, @project)
    end

    it 'can update its own projects' do
      @ability.should be_able_to(:update, @project)
    end

    it 'can delete its own projects' do
      @ability.should be_able_to(:destroy, @project)
    end

  end

  context 'user story authorization' do

    before(:each) do
      @project = Factory(:project)
      @user = Factory(:user)
      @project.users << @user
      @user_story = Factory(:user_story, :project => @project)
      @ability = Ability.new(@user)
    end

    it 'can create a user story' do
      @ability.should be_able_to(:create, UserStory)
    end

    it 'can view its own user stories' do
      @ability.should be_able_to(:read, @user_story)
    end

    it 'can update its own user stories' do
      @ability.should be_able_to(:update, @user_story)
    end

    it 'can update its own user stories statuses' do
      @ability.should be_able_to(:update_status, @user_story)
    end

    it 'can delete its own user stories' do
      @ability.should be_able_to(:destroy, @user_story)
    end

  end

end

