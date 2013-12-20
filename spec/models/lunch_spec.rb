require 'spec_helper'

describe Lunch do

  it { should have_valid(:name).when("sf") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_many :groups }
end
