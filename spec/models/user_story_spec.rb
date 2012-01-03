require 'spec_helper'

describe UserStory do

  it 'returns its story size first letter' do
    story_size = Factory(:story_size, :name => 'Small')
    user_story = Factory(:user_story, :story_size => story_size)
    user_story.size.should == 'S'
  end

  it 'returns an unknown story size' do
    user_story = Factory(:user_story, :story_size => nil)
    user_story.size.should == '?'
  end

end

