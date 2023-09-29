class ProfilsController < ApplicationController
  skip_before_action :authenticate_user!, only: :view
  before_action :set_user

  def index
    @profiles = Profil.all
  end

  def show
  end

  def new
    @profile = Profil.new
    @interest = @profile.interests.new
  end

  def create
    @profile = Profil.new(profil_params)
    # link new profil to current user
    @profile.user_id = current_user.id
    if @profile.save
      return redirect_to pages_dashboard_path
    end
    render new, status: :unprocessable_entity
  end

  def edit
    @profile = Profil.find(params[:id])
  end

  def update
    @profile = Profil.find(params[:id])
    return redirect_to pages_dashboard_path if @profile.update(profil_params)

    render edit, status: :unprocessable_entity
  end

  private

  def profil_params
    params.require(:profil).permit(:name, :wohnort, interests_attributes:[:name])
  end

  def set_user
    @user = current_user
  end
end
