require 'spec_helper'

describe "WelcomePages" do
    
  describe "Welcome Page" do
      
      it "should have the proper welcome content" do
         visit '/welcome_pages/welcome'
         expect(page).to have_content('Welcome to Life Tracker') 
        end
          
         it "should have the proper signing in/up options" do
             visit '/welcome_pages/welcome'
            expect(page).to have_content('Sign up now') 
            expect(page).to have_content('Sign in') 
         end
      
        it " should have a footer with the help and about links" do
            visit '/welcome_pages/welcome'
            expect(page).to have_content('About')
            expect(page).to have_content('Help')
        end
      
        it "should have a nice welcoming title" do
            visit '/welcome_pages/welcome'
            expect(page).to have_title('Life Tracker | Welcome')
         end
      end
    
    describe "Help Page" do
        
    end
    
    describe "About Page" do
    
    end
end
