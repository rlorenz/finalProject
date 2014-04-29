require 'spec_helper'

describe "User pages" do

    subject { page }

    describe "signup page" do
        before { visit signup_path }

        it { should have_content('Sign up') }
        it { should have_title('Life Tracker | Sign up') }
    end
end