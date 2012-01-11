require 'spec_helper'

describe UserStoriesHelper do

  it 'returns the css for its status section' do
    @status = FactoryGirl.create(:status)
    @user_story = FactoryGirl.create(:user_story, :status => @status)
    helper.status_list.should == "section#status_#{@status.id} ul"
  end

  it 'returns the css for its list item' do
    @user_story = FactoryGirl.create(:user_story)
    helper.user_story_item.should == "li#user_story_#{@user_story.id}"
  end

  it 'highlights the Gerkin terms' do
    text = "In order to pass this test\nAs a tester\nI want to test this right"
    helper.highlight_user_story(text).should == "<p><mark>In order to</mark> pass this test\n<br /><mark>As a</mark> tester\n<br /><mark>I want to</mark> test this right</p>"
  end

end

