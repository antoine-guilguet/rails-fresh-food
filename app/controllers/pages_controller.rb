class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def homepage
    render layout: 'homepage'
  end

  def landing_page
    @sourcing = Sourcing.new
    render layout: 'landing'
  end

  def save_sourcing
    @sourcing = Sourcing.new(lead_params)
    if @sourcing.save
      flash[:notice] = "Merci!"
      redirect_to root_path
    else
      render 'landing_page'
    end
  end

  def download_charte
    send_file(
        "#{Rails.root}/public/charte.pdf",
        filename: "charte_chou_blanc.pdf",
        type: "application/pdf"
    )
  end

  def dashboard
    @producers = current_user.producers
  end

  private

  def lead_params
    params.require(:sourcing).permit(:produit, :exigence, :email)
  end
end
