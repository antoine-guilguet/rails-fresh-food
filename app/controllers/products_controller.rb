class ProductsController < ApplicationController
  before_action :find_product, only:[:show, :add_product_to_list]
  skip_before_action :authenticate_user!, only: :index

  def index
    @subcategories = Subcategory.all

    if params[:query].present? && !params.has_value?("on")
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    elsif params.has_value?("on")
      if params[:query].present?
        product_ids = filter_products_by_subcategory(params, @subcategories.ids).pluck(:id).uniq
        sql_query = "name ILIKE :query OR description ILIKE :query"
        @products = Product.where(sql_query, query: "%#{params[:query]}%").select { |product| product_ids.include?(product.id) }
      else
        @products = filter_products_by_subcategory(params, @subcategories.ids)
      end
    else
      @products = Product.all
    end
  end

  def show
    @producer = @product.producer
    @products = @producer.products.reject{ |product| product.id == @product.id }
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

end
