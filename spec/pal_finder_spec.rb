require 'rails_helper'

describe PalFinder do
  it "returns a user with same interests from same place" do

    user = create(:user)
    profile = create(:current_profile)
    user_interest = build(:interest, name: 'Schach', profil: profile).save

    pal_finder = PalFinder.new(profile)

    pal = pal_finder.find_pal

    puts "#{profile.name}, #{profile.wohnort}, #{profile.interests.last.name}"
    puts "#{pal.name}, #{pal.wohnort}, #{pal.interests.last.name}"

    expect(pal.name).to eq("Petra")
  end

  it "returns a user with same interests from other place" do
    user = create(:other_user)
    profile = build(:shares_interest_profile, name: "Hannelore", wohnort: "Saarbrücken", user: user)
    user_interest = build(:interest, name: 'Schach', profil: profile).save

    pal_finder = PalFinder.new(profile)

    pal = pal_finder.find_pal
    
    puts "#{profile.name}, #{profile.wohnort}, #{profile.interests.last.name}"
    puts "#{pal.name}, #{pal.wohnort}, #{pal.interests.last.name}"

    expect(pal.name).to eq("Petra")
  end

  it "returns nil if there is no other user with shared interest in the system" do

    user = create(:lonely_user)
    profile = build(:shares_interest_profile, name: "Gert", wohnort: "Hamburg", user: user)
    user_interest = build(:interest, name: 'Falknerei', profil: profile).save

    puts "#{profile.name}, #{profile.wohnort}, #{profile.interests.last.name}"

    pal_finder = PalFinder.new(profile)

    expect(pal_finder.find_pal).to eq(nil)
  end
end
