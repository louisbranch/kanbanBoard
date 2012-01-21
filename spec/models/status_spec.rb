require 'spec_helper'

describe Status do

  it 'is order by the oldest one' do
    status1 = FactoryGirl.create(:status, :created_at => 1.week.ago)
    status2 = FactoryGirl.create(:status, :created_at => 2.weeks.ago)
    Status.first.should == status2
  end

  context 'validates' do

    before(:each) do
      @status = FactoryGirl.build(:status)
    end

    it 'its name presence' do
      @status.name = nil
      @status.should have(1).error_on(:name)
    end
  end

  context 'availability' do

    before(:each) do
      @status = FactoryGirl.create(:status)
      user_story = FactoryGirl.create(:user_story, :status => @status)
    end

    it 'is positive' do
      @status.wip = 2
      @status.availability.should == 1
    end

    it 'is negative' do
      @status.wip = 0
      @status.availability.should == -1
    end

    it 'is zero' do
      @status.wip = 1
      @status.availability.should == 0
    end

    it 'is not set' do
      @status.wip = nil
      @status.availability.should == '-'
    end
  end
end
