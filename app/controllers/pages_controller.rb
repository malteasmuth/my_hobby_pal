class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :view

  def view
  end

  def dashboard
    @user_profile = Profil.find_by(user_id: current_user.id)
    find_pal
  end

  def find_pal
    # Service-Klasse, die zur Aufgabe hat, einen zufälligen User aus dem Wohnort
    # des angemeldeten Users zu ermitteln,
    # dessen Interessen sich mit dem eigenen Nutzer überschneiden.

    @user_profile = Profil.find_by(user_id: current_user.id)
    all_interests = @user_profile.interests
    possible_pals = []

    all_interests.each do |interest|
      # all interest entries that do NOT belong to @user_profiles
      interests = Interest.where(name: interest.name)
                          .where.not(profil_id: @user_profile.id)
      # all unique profiles
      profiles = interests.collect{ |i| i.profil}.uniq
      # all profiles at the samle place

      profiles.each do |profil|
        possible_pals << profil
      end
    end


    same_place_profiles = possible_pals.select { |p| p.wohnort == @user_profile.wohnort}

    if same_place_profiles.empty? && possible_pals.empty?
      nil
    elsif same_place_profiles.empty?
      pal = possible_pals.sample
    else
      pal = same_place_profiles.sample
    end
    raise
  end
end
