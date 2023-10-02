FactoryBot.define do
  factory :interest, class: Interest do
    name { "Schach" }
    profil_id { association :current_profile }
  end
end
