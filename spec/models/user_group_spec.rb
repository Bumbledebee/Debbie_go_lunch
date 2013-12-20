require 'spec_helper'

describe UserGroup do
  it { should have_valid(:user_id).when(13,2,3) }
  it { should_not have_valid(:group_id).when(nil, '', 'sdf') }

  it { should have_valid(:group_id).when(1,23,4) }
  it { should_not have_valid(:group_id).when(nil,'','sfd') }

  it { should belong_to :group }
  it { should belong_to :user}

end
