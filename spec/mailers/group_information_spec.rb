require "spec_helper"

describe GroupInformation do
  describe "your_group" do
    let(:mail) { GroupInformation.your_group }

    it "renders the headers" do
      mail.subject.should eq("Your group")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
