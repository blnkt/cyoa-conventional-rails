FactoryGirl.define do
  factory :user do
    name "blnkt"
    email "blnkt@blnkt.com"
    password "password"
    password_confirmation "password"
  end

  factory :adventure do
    title 'the raven flies at midnight'
    user_id 1
  end

  factory :chapter do
  	prompt 'unexpected astronaut'
    episode 'no one ever expects the unexpected astronaut'
  end
end