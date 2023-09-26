class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :view

  def view
  end

  def dashboard
  end
end
