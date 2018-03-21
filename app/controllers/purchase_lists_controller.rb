class PurchaseListsController < ApplicationController
  before_action :find_producer, only: [:new, :create, :show]
  before_action :find_purchase_list, only: [:show]
  include PurchaseListsHelper

  def index

  end

  def new
    @purchase_list = PurchaseList.new
    @products = @producer.products
    @frequencies = [[0, "Une seule fois"], [1, "1 fois par semaine"], [2, "2 fois par mois"], [3, "3 fois par mois"], [4, "4 fois par mois"]]
  end

  def create
    @purchase_list = PurchaseList.new(purchase_list_params)
    frequency = params[:frequency_list]
    if params_is_number?(frequency)
      frequency = frequency.to_i
      if frequency == 0
        @purchase_list.recurrence = false
      else
        @purchase_list.recurrence = true
        @purchase_list.frequency = frequency
      end
    end
    @purchase_list.user = current_user
    @purchase_list.producer = @producer
    if @purchase_list.save
      redirect_to dashboard_path
    else
      raise
      @products = @producer.products
      @frequencies = [[0, "Une seule fois"], [1, "1 fois par semaine"], [2, "2 fois par mois"], [3, "3 fois par mois"], [4, "4 fois par mois"]]
      render 'new'
    end
  end

  def show
    @products = @producer.products
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_producer
    @producer = Producer.find(params[:producer_id])
  end

  def find_purchase_list
    @purchase_list = PurchaseList.find(params[:id])
  end

  def purchase_list_params
    params.require(:purchase_list).permit(:name)
  end
end
