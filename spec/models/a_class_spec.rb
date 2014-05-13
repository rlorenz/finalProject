require 'spec_helper'

describe AClass do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @a_class = AClass.new(name: "Science", user_id: user.id)
  end

  subject { @a_class }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
    
  it { should be_valid }

  describe "when user_id is not present" do
    before { @a_class.user_id = nil }
    it { should_not be_valid }
  end
    
    describe "when user_id is not present" do
    before { @a_class.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @a_class.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @a_class.name = "a" * 41 }
    it { should_not be_valid }
  end
end