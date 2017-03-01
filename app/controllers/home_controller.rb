class HomeController < ApplicationController
  def root
    if user_signed_in?
      redirect_to inventory_path
    else
      redirect_to login_path
    end
  end
end
