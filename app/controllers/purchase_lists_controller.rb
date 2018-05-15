class PurchaseListsController < ApplicationController
  before_action :find_producer
  before_action :find_purchase_list, except: [:new, :index, :create]
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
      redirect_to producer_purchase_list_path(@producer, @purchase_list)
    else
      @products = @producer.products
      @frequencies = [[0, "Une seule fois"], [1, "1 fois par semaine"], [2, "2 fois par mois"], [3, "3 fois par mois"], [4, "4 fois par mois"]]
      render 'new'
    end
  end

  def show
    @products = @producer.products
  end

  def edit
    @frequencies = [[0, "Une seule fois"], [1, "1 fois par semaine"], [2, "2 fois par mois"], [3, "3 fois par mois"], [4, "4 fois par mois"]]
  end

  def update
    @purchase_list.update(purchase_list_params)
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
    @purchase_list.save
    redirect_to producer_purchase_list_path(@producer, @purchase_list)
  end

  def destroy
    @purchase_list.destroy
    redirect_to dashboard_path
  end

  def add_product_to_list
    @product = Product.find( params[:product_id])
    @purchase_product = PurchaseProduct.new(product_id: @product.id, purchase_list_id: @purchase_list.id, quantity: params[:number])
    if @purchase_product.save
      redirect_to producer_purchase_list_path(@producer, @purchase_list)
      flash[:notice] = "#{@product.name.split.first } ajouté"
    else
      redirect_to producer_purchase_list_path(@producer, @purchase_list)
      flash[:alert] = "Le Produit n'a pas pu être ajouté"
    end
  end

  def remove_product_from_list
    @purchase_product = PurchaseProduct.find(params[:purchase_product_id])
    if @purchase_product
      purchase_product_id = @purchase_product.id
      @purchase_product.destroy
      render json: {
        message: "Produit enlevé de la liste",
        purchase_product_id: purchase_product_id,
        total_items: @purchase_list.compute_total_items,
        total_weight: @purchase_list.compute_total_weight,
        total_price: @purchase_list.compute_total_expense
      }
    else
      render json: {
          message: "Suppression a échoué"
      }
    end
  end

  private

  def find_producer
    @producer = Producer.find(params[:producer_id])
  end

  def find_purchase_list
    @purchase_list = PurchaseList.find(params[:id])
  end

  def purchase_list_params
    params.require(:purchase_list).permit(:name, :delivery_date)
  end
end
