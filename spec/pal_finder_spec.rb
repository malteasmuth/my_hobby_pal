require 'rails_helper'

describe PalFinder do
  context "when there is another user with shared interest in the same place" do
    let(:profile) { create(:profil, wohnort: 'Saarbrücken') }
    let!(:user_interest) { create(:interest, interest: 'Schach', profil: profile) }
    let(:matching_profile) { create(:profil,  wohnort: 'Saarbrücken') }
    let!(:matching_interest) { create(:interest, interest: 'Schach', profil: matching_profile) }

    subject(:pal) { PalFinder.new(profile).find_pal }

    it "returns the found user" do
      expect(pal.name).to eq(matching_profile.name)
    end
  end

  context "when there is a user with same interests from other place" do
    let(:profile) { create(:profil, wohnort: 'Saarbrücken') }
    let!(:user_interest) { create(:interest, interest: 'Schach', profil: profile) }
    let(:matching_profile) { create(:profil,  wohnort: 'Köln') }
    let!(:matching_interest) { create(:interest, interest: 'Schach', profil: matching_profile) }

    subject(:pal) { PalFinder.new(profile).find_pal }

    it "returns a user with same interests from other place" do
      expect(pal.name).to eq(matching_profile.name)
    end
  end

  context "when there is no other user with shared interest in the system" do
    let(:user) { create(:lonely_user) }
    let(:profile) { create(:profil, :shares_interest_profile, name: "Gert", wohnort: "Hamburg", user: user) }
    let!(:user_interest) { create(:interest, interest: 'Falknerei', profil: profile) }

    subject(:pal_finder) { PalFinder.new(profile) }

    it "returns nil" do
      expect(pal_finder.find_pal).to eq(nil)
    end
  end
end