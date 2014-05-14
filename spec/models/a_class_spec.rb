require 'spec_helper'

describe AClass do

  let(:user) { FactoryGirl.create(:user, email: "iAmexample@email.com") }
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
  it { should respond_to(:tasks) }

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
    
    
   describe "task associations" do

    before { @a_class.save }
    let!(:older_task) do
      FactoryGirl.create(:task, a_class: @a_class, dueDate: "2014-08-15")
    end
    let!(:newer_task) do
      FactoryGirl.create(:task, a_class: @a_class, dueDate: "2014-07-10")
    end

    it "should have the right mtasks in the right order" do
      expect(@a_class.tasks.to_a).to eq [newer_task, older_task]
    end
       
    it "should destroy associated microposts" do
      tasks = @a_class.tasks.to_a
      @a_class.destroy
      expect(tasks).not_to be_empty
      tasks.each do |task|
        expect(Task.where(id: task.id)).to be_empty
      end
    end
  end
end