class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "商品を登録しました"
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # ↓ 削除後に一覧に戻る
    redirect_to products_path, notice: "商品を削除しました"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
