FactoryBot.define do
  factory :user, class: User do
    email { 'herbert@saar.com' }
    password { 'Kleister42' }
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
