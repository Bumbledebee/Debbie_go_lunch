require 'spec_helper'

describe User do
  it { should have_valid(:name).when("Anja wer", "sadf asdf") }
  it { should_not have_valid(:name).when(nil, '') }

  let(:bad_email) { ["@.com", "mail.com", "mail@com@com.com", nil, '', ]}
  let(:good_email) { ["debbie@gmail.com", "bla@hotmail.com"]}

  it { should have_valid(:email).when(*good_email) }
  it { should_not have_valid(:email).when(*bad_email)}

  it { should have_valid(:name).when(User.new) }

  it { should have_many :lunches }
  it { should have_many :groups }

  it 'has matching password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

end
