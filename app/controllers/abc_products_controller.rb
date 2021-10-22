class AbcProductsController < ApplicationController
  def index
    @abc_products = if current_user.status == 'paid'
                      AbcProduct.all
                    else
                      AbcProduct.free
                    end
  end

  def show
    @abc_product = AbcProduct.find(params[:id])
    redirect_to products_path, alert: 'Only for Paid Subscribers' if @abc_product.user_status? && current_user.status != 1
  end

  def new
    @abc_products = AbcProduct.new
  end

  def create
    @abc_products = AbcProduct.new(abc_product_params)
    if @abc_products.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @abc_products = AbcProduct.find(params[:id])
  end

  def update
    @abc_products = AbcProduct.find(params[:id])
    if @abc_products.update(abc_product_params)
      flash[:notice] = 'Sucessfully updated Product'
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @abc_products = AbcProduct.find(params[:id])
    if @abc_products.destroy
      flash[:notice] = 'Sucessfully deleted Product'
      redirect_to products_path
    else
      render :minibooks_path
    end
  end

  private

  def abc_product_params
    params.require(:abc_product).permit(:product_name, :product_price, :user_status)
  end
end
