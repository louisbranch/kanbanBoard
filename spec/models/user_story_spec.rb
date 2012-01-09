require 'spec_helper'

describe UserStory do

  context 'with story size' do

    before(:each) do
      story_size = Factory(:story_size, :name => 'Small')
      @user_story = Factory(:user_story, :story_size => story_size)
    end

    it 'returns its first letter' do
      @user_story.size.should == 'S'
    end

    it 'returns its name formated' do
      @user_story.size_alias.should == 'small'
    end

  end

  context 'without story size' do

    before(:each) do
      @user_story = Factory(:user_story, :story_size => nil)
    end

    it 'returns an unknown size' do
      @user_story.size.should == '?'
    end

    it 'returns a blank name' do
      @user_story.size_alias.should == nil
    end

  end
end

