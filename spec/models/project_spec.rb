require 'spec_helper'

describe Project do

  context 'validates' do

    before(:each) do
      @project = FactoryGirl.build(:project)
    end

    it 'its name presence' do
      @project.name = nil
      @project.should have(1).error_on(:name)
    end

    it 'its description presence' do
      @project.description = nil
      @project.should have(1).error_on(:description)
    end

  end

  it 'creates a Backlog status automatically' do
    @project = FactoryGirl.create(:project)
    @project.statuses.count == 1
    @project.statuses.first.name == 'Backlog'
  end

  context 'members' do

    before(:each) do
      @project = Factory(:project)
      @user = Factory(:user, :name => 'Luiz Branco')
      @project.users << @user
    end

    it 'returns if it has a given member' do
      @project.member?(@user).should == true
    end

    it 'removes a member' do
      @project.remove_member(@user)
      @project.users.count.should == 0
    end

  end

end

