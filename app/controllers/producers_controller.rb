class ProducersController < ApplicationController
  before_action :find_producer, only:[:show, :edit, :update, :destroy]

  def index
    @producers = current_user.producers
  end

  def show
    @products = @producer.products
    activities = Activity.where(producer_id: @producer.id)
    @category = activities.first.category if !activities.empty?
  end

  def new
    @producer = Producer.new
    @categories = Category.all
  end

  def create
    @producer = Producer.new(producer_params)
    if @producer.save
      if params[:category_list].to_i
        category = Category.find(params[:category_list].to_i)
        Activity.create(producer_id: @producer.id, category_id: category.id)
      end
      redirect_to producers_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @producer.update(producer_params)
      redirect_to producers_path
    else
      render 'edit'
    end
  end

  def destroy
    @producer.destroy
    redirect_to producers_path
  end

  def select_producer
    @producers = Producer.all
  end

  def upload_producer
    @producer = Producer.new
    @categories = Category.all
  end

  def add_producer_to_favorites
    @producer = Producer.find(params[:producer_id])
    @supplier = Supplier.new(user_id: current_user.id, producer_id: @producer.id)
    if @supplier.save
      render json: {
          producer_name: @producer.name,
          message: "Ajouter aux favoris"
      }
    else
      Supplier.find_by(user_id: current_user.id, producer_id: @producer.id).destroy
      render json: {
          producer_name: @producer.name,
          message: "Retirer des favoris"
      }
    end
  end

  private

  def find_producer
    @producer = Producer.find(params[:id])
  end

  def producer_params
    params.require(:producer).permit(:name, :description, :address, :first_name, :last_name, :phone_number, :photo, :photo_cache)
  end
end
