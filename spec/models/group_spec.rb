require 'spec_helper'

describe Group do
  it { should have_valid(:name).when("sdf", "qwe") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:lunch_id).when( 3, 23, 23) }
  it { should_not have_valid(:lunch_id).when( nil, '', 'sfd') }

  it { should belong_to :lunch }
end
