class PagesController < ApplicationController

  def homepage
    @lead = Lead.new
    render layout: 'homepage'
  end

  def save_address
    @lead = Lead.new(lead_params)
    @lead.street_number = params[:street_number]
    @lead.route= params[:route]
    @lead.locality= params[:locality]
    @lead.country= params[:country]
    if @lead.save
      flash[:notice] = "Merci!"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      redirect_to root_path
      flash[:alert] = "Entrez une adresse"
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:address)
  end
end
