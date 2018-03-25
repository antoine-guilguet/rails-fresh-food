class ProductsController < ApplicationController
  before_action :find_product, only:[:show, :add_product_to_list]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @subcategories = Subcategory.all

    if params[:query].present? && !params.has_value?("on")
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
      check_empty_search
    elsif params.has_value?("on")
      if params[:query].present?
        product_ids = filter_products_by_subcategory(params, @subcategories.ids).pluck(:id).uniq
        sql_query = "name ILIKE :query OR description ILIKE :query"
        @products = Product.where(sql_query, query: "%#{params[:query]}%").select { |product| product_ids.include?(product.id) }
        check_empty_search
      else
        @products = filter_products_by_subcategory(params, @subcategories.ids)
        check_empty_search
      end
    else
      @products = Product.all
    end
  end

  def show
    @producer = @product.producer
    @products = @producer.products.reject{ |product| product.id == @product.id }
  end

  def add_product_to_list
    @producer = @product.producer
    @purchase_lists = PurchaseList.where(producer_id: @producer.id, user_id: current_user.id)
    if @purchase_lists.empty?
      @purchase_list = PurchaseList.create(name: @product.name, producer_id: @producer.id, user_id: current_user.id, frequency: 0, recurrence: false, delivery_date: Date.today)
      @purchase_product = PurchaseProduct.create(purchase_list_id: @purchase_list.id, product_id: @product.id, quantity: 1)
      redirect_to producer_purchase_list_path(@producer, @purchase_list)
    else
      @purchase_list = @purchase_lists.first
      @purchase_product = PurchaseProduct.create(purchase_list_id: @purchase_list.id, product_id: @product.id, quantity: 1)
      redirect_to producer_purchase_list_path(@producer, @purchase_list)
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def filter_products_by_subcategory(params, subcategory_ids)
    array_products = Array.new
    subcategory_ids.each do |k|
      if params.has_key?("subcategory_#{k}")
        array_associations = Subcategory.find(k).products
        array_associations.each do |producer|
          array_products << producer
        end
      end
    end
    array_products
  end

  def check_empty_search
    if @products.empty?
      @products = Product.all
      flash[:alert] = "Aucun Produit trouvé"
    end
  end

end
