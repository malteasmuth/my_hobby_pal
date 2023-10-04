FactoryBot.define do
  factory :profil do
    name { FFaker::Name.name }
    wohnort { FFaker::AddressDE.city }
    association :user, factory: :user
  end

  factory :current_profile, class: Profil do
    name { 'Herbert' }
    wohnort { 'Köln' }
    user_id { '1' }
  end

  factory :shares_interest_profile, class: Profil do
    name { 'Hannelore' }
    wohnort { 'Saarbrücken'}
    user_id { '2' }
  end
end
