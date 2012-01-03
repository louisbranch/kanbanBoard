require 'spec_helper'

describe Invitation do

  it 'searchs for an email' do
    invitation = Factory(:invitation, :email => 'artfikan@gmail.com')
    Invitation.search('artfikan@gmail.com').should include(invitation)
  end

  it 'returns true if it has a given email' do
    invitation = Factory(:invitation, :email => 'artfikan@gmail.com')
    Invitation.for?('artfikan@gmail.com').should == true
  end

  it 'returns false if it doesn\'t have a given email' do
    Invitation.for?('artfikan@gmail.com').should == false
  end

end

