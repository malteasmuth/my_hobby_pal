class ProfilsController < ApplicationController
  skip_before_action :authenticate_user!, only: :view
  before_action :set_user

  def index
    @profiles = Profil.all
  end

  def show
  end

  def new
    @profil = Profil.new
  end

  def create
    @profil = Profil.new(profil_params)
    # link new profil to current user
    @profil.user_id = current_user.id
    return redirect_to pages_dashboard_path if @profil.save

    render new, status: :unprocessable_entity
  end

  def edit
    @profil = Profil.find(params[:id])
  end

  def update
    @profil = Profil.find(params[:id])
    return redirect_to pages_dashboard_path if @profil.update(profil_params)

    render edit, status: :unprocessable_entity
  end

  private

  def profil_params
    params.require(:profil).permit(:name, :wohnort)
  end

  def set_user
    @user = current_user
  end

end
