require 'spec_helper'

describe UserLunch do

  it { should belong_to :lunch }
  it { should belong_to :user }
end
