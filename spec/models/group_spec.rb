require 'spec_helper'

describe Group do
  it { should have_valid(:name).when("sdf", "qwe") }
  it { should_not have_valid(:name).when(nil, '') }

  it { should belong_to :lunch }

  describe "#set_group_leader" do
    let(:group) { FactoryGirl.create(:group) }

    let!(:willing_user) { FactoryGirl.create(:user_willing_to_be_leader) }
    let!(:kind_of_willing_user) { FactoryGirl.create(:user_kind_of_willing_to_be_leader) }
    let!(:not_willing_user) { FactoryGirl.create(:user_not_willing_to_be_leader) }

    context "when members are willing to be the leader" do
      before do
        group.users << User.all
      end

      it "chooses the first willing member as the leader" do
        group.set_group_leader
        expect(group.lunchgroupleader).to eql willing_user.id
      end
    end

    context "when the most willing member is kind of willing to be the leader" do
      before do
        group.users << User.where.not(lunchgroupleader: "sure, no prob")
      end

      it "chooses the first willing member as the leader" do
        group.set_group_leader
        expect(group.lunchgroupleader).to eql kind_of_willing_user.id
      end
    end
  end
end

