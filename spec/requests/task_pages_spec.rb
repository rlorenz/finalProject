require 'spec_helper'

describe "Task pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user, email: "userrrr@user.com") }
  let(:a_class) { FactoryGirl.create(:a_class, user: user) }
  before do
            visit signin_path
            fill_in "Email",    with: user.email.upcase
            fill_in "Password", with: user.password
            click_button "Sign in" 
            visit a_class_path(a_class)
        end

  describe "micropost creation" do

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Add task" }.not_to change(Task, :count)
      end
    end

    describe "with valid information" do

      before do
          fill_in 'task_name', with: "Oh my" 
          fill_in 'task_description', with: "ohhh my"
          fill_in 'task_dueDate', with: "2014-05-06"
      end
        
      it "should create a micropost" do
        expect { click_button "Add task" }.to change(Task, :count).by(1)
      end
    end
  end
end