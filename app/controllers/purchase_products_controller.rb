class PurchaseProductsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @purchase_product = PurchaseProduct.find(params[:id])
  end

  def edit
    @purchase_product = PurchaseProduct.find(params[:id])
  end

  def update
    @purchase_product = PurchaseProduct.find(params[:id])
    respond_to do |format|
      if @purchase_product.update(purchase_product_params)
        format.html {
          redirect_to(producer_purchase_list_path(@purchase_product.purchase_list.producer),
          :notice => 'User was successfully updated.')
        }
        format.json { respond_with_bip(@purchase_product) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@purchase_product) }
      end
    end
  end

  private

  def purchase_product_params
    params.require(:purchase_product).permit(:quantity)
  end

end
