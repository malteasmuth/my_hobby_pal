FactoryBot.define do
  factory :profil do
    name { FFaker::Name.name }
    wohnort { FFaker::AddressDE.city }
    association :user, factory: :user

    trait :current_profile do
      name { 'Herbert' }
      wohnort { 'Köln' }
      user_id { '1' }
    end

    trait :shares_interest_profile do
      name { 'Hannelore' }
      wohnort { 'Saarbrücken'}
      user_id { '2' }
    end
  end
end
