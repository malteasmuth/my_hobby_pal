FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end

  factory :other_user, class: User do
    email { 'hannelore@berlin.com' }
    password { 'fas9123sa,' }
  end

  factory :lonely_user, class: User do
    email { 'gert@heinrichs.de'}
    password { 'asd23470245d'}
  end
end
