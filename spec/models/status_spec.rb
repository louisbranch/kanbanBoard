require 'spec_helper'

describe Status do

  it 'formats its name' do
    status = Factory(:status, :name => 'To Do')
		status.alias.should == 'to_do'
  end

end

