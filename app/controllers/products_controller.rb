class ProductsController < ApplicationController
  before_action :find_product, only:[:show]

  def index
    @subcategories = Subcategory.all

    if params[:query].present? && !params.has_value?("on")
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%")
    elsif params.has_value?("on")
      if params[:query].present?
        product_ids = filter_products_by_subcategory(params, @subcategories.count).pluck(:id).uniq
        sql_query = "name ILIKE :query OR description ILIKE :query"
        @products = Product.where(sql_query, query: "%#{params[:query]}%").select { |product| product_ids.include?(product.id) }
      else
        @products = filter_products_by_subcategory(params, @subcategories.count)
      end
    else
      @products = Product.all
    end
  end

  def show
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def filter_products_by_subcategory(params, number_of_subcategories)
    array_products = Array.new
    (1..number_of_subcategories).each do |k|
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
