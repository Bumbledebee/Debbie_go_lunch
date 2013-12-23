require 'spec_helper'

describe Group do
  it { should have_valid(:name).when("sdf", "qwe") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should belong_to :lunch }
end
