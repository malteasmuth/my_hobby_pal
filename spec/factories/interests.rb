FactoryBot.define do
  factory :interest, class: Interest do
    interest { %w[Schach Reiten Fallschirmspringen].sample }
    profil_id { association :current_profile }
  end
end
