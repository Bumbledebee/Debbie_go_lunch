require 'spec_helper'

describe UserGroup do

  it { should belong_to :group }
  it { should belong_to :user}

end
