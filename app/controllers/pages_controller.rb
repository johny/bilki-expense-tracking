class PagesController < ApplicationController

  def index
    if user_signed_in?
      redirect_to today_bills_path
    else
      render layout: 'landing'
    end
  end

end
