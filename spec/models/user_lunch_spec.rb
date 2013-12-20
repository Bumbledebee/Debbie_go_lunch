require 'spec_helper'

describe UserLunch do

  it { should have_valid(:user_id).when(23,132,5) }
  it { should_not have_valid(:user_id).when(nil, '', 'sdf') }

  it { should have_valid(:lunch_id).when(1,45,5) }
  it { should_not have_valid(:lunch_id).when(nil, '', 'sdf') }

  it { should belong_to :lunch }
  it { should belong_to :user }
end
