FactoryGirl.define do
    factory :user do
        name "Randall Lorenz"
        email "rlorenz@wisc.edu"
        password "foobar"
        password_confirmation "foobar"
    end
end