require 'spec_helper'

describe "Class pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before do
        visit signin_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
  end

  describe "class creation" do
    before { visit addclass_path }

    describe "with invalid information" do
    
      it "should not create a class" do          
        expect { click_button "Add class" }.not_to change(AClass, :count)
      end

      describe "error messages" do
        before do 
            visit addclass_path
            click_button "Add class"
        end
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
          visit addclass_path
          fill_in 'a_class_name', with: "Science" 
      end
        
      it "should create a class" do
        
        expect { click_button "Add class" }.to change(AClass, :count).by(1)
      end
    end
  end
    
    describe "class destruction" do
        before { FactoryGirl.create(:a_class, user: user) }

        describe "as correct user" do
            before { visit user_path(user) }

      it "should delete a class" do
        expect { click_link "remove" }.to change(AClass, :count).by(-1)
      end
    end
  end
    
    describe "class page" do
        let!(:a_class) { FactoryGirl.create(:a_class, user: user, name: "Science") }
        let!(:t1) { FactoryGirl.create(:task, a_class: a_class, name: "Homework 1") }
        let!(:t2) { FactoryGirl.create(:task, a_class: a_class, name: "Homework 2") }
        
        before { visit a_class_path(a_class) }
        
        it { should have_content(a_class.name) }
        it { should have_title(a_class.name) }
        
        describe "tasks" do
            it { should have_content(t1.name) }
            it { should have_content(t2.name) }
            it { should have_content(a_class.tasks.count) }
        end
    end
end
