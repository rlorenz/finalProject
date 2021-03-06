require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

    describe "signin" do
      before { visit signin_path }

      describe "with invalid information" do
        before { click_button "Sign in" }

        it { should have_title('Sign in') }
        it { should have_selector('div.alert.alert-error') }
          
        describe "after visiting another page" do
            before { click_link "life tracker" }
            it { should_not have_selector('div.alert.alert-error') }
        end
      end
        
     describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
         
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

    describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end
        describe "in the class controller" do

        describe "submitting to the create action" do
          before { post a_classes_path }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete a_class_path(FactoryGirl.create(:a_class)) }
          specify { expect(response).to redirect_to(signin_path) }
        end
      end
        
    end
        
      describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name: "dinger",  email: "wrong@example.com") }
       before do
        visit signin_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in" 
    end

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match('Edit user') }
        specify { expect(response).to redirect_to(signin_path) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(signin_path) }
      end
          
        describe "trying to see someone elses home page" do
            before { visit user_path(wrong_user) }
            it { should_not have_content('dinger') }
        end
    end
  end
end