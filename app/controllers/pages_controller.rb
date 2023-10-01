class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :view

  def view
  end

  def dashboard
    @user_profile = Profil.find_by(user_id: current_user.id)
    @pal = Profil.find(params[:pal]) unless params[:pal].nil?
  end

  def pal_finder
    @user_profile = Profil.find_by(user_id: current_user.id)
    @pal = PalFinder.new(@user_profile).find_pal
    redirect_to pages_dashboard_path(pal: @pal)
  end
end
