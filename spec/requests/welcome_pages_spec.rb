require 'spec_helper'

describe "WelcomePages" do
    
    subject { page }
    
  describe "Welcome Page" do
      
      before { visit welcome_path }
      
         it { should have_content('Welcome to Life Tracker') }
         it { should have_content('Sign up now') }
         it { should have_content('Sign in') }
         it { should have_content('About') }
         it { should have_content('Help') }
         it { should have_title('Life Tracker | Welcome') }
      
      end
    
    describe "Help Page" do
        
        before { visit help_path }
        
        it { should have_content('Sign in') }
        it { should have_content('About') }
        it { should have_content('Help') }
        it { should have_title('Life Tracker | Help') }
        
    end
    
    describe "About Page" do
        
        before { visit about_path }
        
        it { should have_content('Sign in') }
        it { should have_content('About') }
        it { should have_content('Help') }
        it { should have_title('Life Tracker | About') }
        
    end
    
    it "should have the correct links" do
        
        visit welcome_path
        click_link "About"
        expect(page).to have_title('Life Tracker | About') 
        click_link "Help"
        expect(page).to have_title('Life Tracker | Help') 
        click_link "life tracker"
        expect(page).to have_title('Life Tracker | Welcomw') 
        
    end
        
end
