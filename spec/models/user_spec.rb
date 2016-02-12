require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:auth_token) }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('supreme036@gmail.com').for(:email) }
  it { should validate_uniqueness_of(:auth_token)}
  it { should have_many(:products) }

    describe "#generate_authentication_token!" do
      it "generates a unique token" do
        Devise.stub(:friendly_token).and_return("auniquetoken1234")
        @user.generate_authentication_token!
        expect(@user.auth_token).to eql "auniquetoken1234"
      end

      it "generates another token when one has already been taken" do
        exsisting_user = FactoryGirl.create(:user, auth_token: "auniquetoken1234")
        @user.generate_authentication_token!
        expect(@user.auth_token).not_to eql exsisting_user.auth_token
      end
    end

end
