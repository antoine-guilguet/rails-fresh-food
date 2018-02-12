class PagesController < ApplicationController

  def homepage
    @sourcing = Sourcing.new
    render layout: 'homepage'
  end

  def landing_page
    @sourcing = Sourcing.new
  end

  def save_sourcing
    @sourcing = Sourcing.new(lead_params)
    if @sourcing.save
      flash[:notice] = "Merci!"
      redirect_to root_path
    else
      render 'homepage', layout: 'homepage'
    end
  end

  private

  def lead_params
    params.require(:sourcing).permit(:produit, :exigence, :email)
  end
end
