class PalFinder
  def initialize(profile)
    @current_profile = profile
  end

  def find_pal

    all_interests = @current_profile.interests
    possible_pals = []

    all_interests.each do |interest|
      # all interest entries that do NOT belong to @user_profiles
      interests = Interest.where(name: interest.name)
                          .where.not(profil_id: @current_profile.id)
      # all unique profiles
      profiles = interests.collect{ |i| i.profil}.uniq
      profiles.each do |profil|
        possible_pals << profil
      end
    end

    # select for users at the same place
    same_place_profiles = possible_pals.select { |p| p.wohnort == @current_profile.wohnort}

    if same_place_profiles.empty? && possible_pals.empty?
      nil
    elsif same_place_profiles.empty?
      pal = possible_pals.sample
    else
      pal = same_place_profiles.sample
    end
  end
end
