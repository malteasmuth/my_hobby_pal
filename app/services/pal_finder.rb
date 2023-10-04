class PalFinder
  def initialize(profile)
    @current_profile = profile
  end

  def find_pal
    all_profile_interests = @current_profile.interests.pluck(:interest)

    pal_profiles = Profil.joins(:interests)
                         .where(interests: { interest: all_profile_interests })
                         .where.not(id: @current_profile.id)
                         .distinct

    same_place_pals = pal_profiles.where(wohnort: @current_profile.wohnort)
    return same_place_pals.sample unless same_place_pals.empty?

    other_place_pals = pal_profiles.where.not(wohnort: @current_profile.wohnort)
    other_place_pals.empty? ? nil : other_place_pals.sample
  end
end
