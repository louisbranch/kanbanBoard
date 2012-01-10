require 'spec_helper'

describe Project do

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

