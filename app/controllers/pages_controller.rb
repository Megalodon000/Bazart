class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about]

  def home
    @collections = ["chairs", "pots", "chandeliers"]
  end

  def about
  end
end
