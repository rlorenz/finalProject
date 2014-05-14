FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
  end


  factory :a_class do
    name "Science"
    user
  end
    
  factory :task do
      name "Homework"
      description "Some work to be done"
      dueDate "20140914"
      a_class
  end
end