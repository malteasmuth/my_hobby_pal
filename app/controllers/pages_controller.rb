class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :view

  def view
  end

  def dashboard
    @user_profile = Profil.find_by(user_id: current_user.id)
  end
end
