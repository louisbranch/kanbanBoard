require 'spec_helper'

describe Issue do

  context "validations" do

    let(:issue){ FactoryGirl.build(:issue)}

    it "should be valid" do
      issue.should be_valid
    end

    it "requires a description" do
      issue.description = nil
      issue.should_not be_valid
      issue.errors[:description].should include("can't be blank")
    end

  end


end
