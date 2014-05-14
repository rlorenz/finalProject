require 'spec_helper'

describe Task do

  let(:user) { FactoryGirl.create(:user) }
  let(:a_class) { FactoryGirl.create(:a_class, user: user) }
  before do
        visit signin_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"        
        @task = Task.new(name: "Homework 1", description: "oh man a homework", dueDate: "20140513", a_class_id: a_class.id)
  end
    
    subject { @task }
    
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:dueDate) }
    it { should respond_to(:a_class_id) }
    its(:a_class) { should eq a_class }

    
    it { should be_valid }

    describe "when a_class_id is not present" do
        before { @task.a_class_id = nil }
        it { should_not be_valid }
    end
    
    describe "when name is too long" do
        before { @task.name = "a" * 51 }
        it { should_not be_valid }
    end
    
    describe "when description is too long" do
        before { @task.description = "a" * 121 }
        it { should_not be_valid }
    end
    
    describe "when name is blank" do
        before { @task.name = " " }
        it { should_not be_valid }
    end
    
    describe "when date is invalid" do
        before { @task.dueDate = "201-0607" }
        it { should_not be_valid }
    end
    
    describe "when date is correct" do
        before { @task.dueDate = "2014-05-07" }
        it { should be_valid }
    end
end