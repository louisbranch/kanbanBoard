require 'spec_helper'

describe UserStory do

  context 'validates' do

    before(:each) do
      @user_story = FactoryGirl.build(:user_story)
    end

    it 'its name presence' do
      @user_story.name = nil
      @user_story.should have(1).error_on(:name)
    end

    it 'its description presence' do
      @user_story.description = nil
      @user_story.should have(1).error_on(:description)
    end

  end

  context 'with story size' do

    before(:each) do
      story_size = FactoryGirl.create(:story_size, :name => 'Small')
      @user_story = FactoryGirl.create(:user_story, :story_size => story_size)
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
      @user_story = FactoryGirl.create(:user_story, :story_size => nil)
    end

    it 'returns an unknown size' do
      @user_story.size.should == '?'
    end

    it 'returns a blank name' do
      @user_story.size_alias.should == nil
    end

  end
end

