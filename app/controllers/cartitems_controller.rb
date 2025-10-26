class CartitemsController < ApplicationController
  def new
    @cart_item = CartItem.new
  end

  def create
    product = Product.find(params[:product_id])
    cart = current_cart
    existing_item = cart.cart_items.find_by(product_id: product.id)

    if existing_item
      existing_item.qty += 1
      existing_item.save
    else
      cart.cart_items.create(product: product, qty: 1)
    end
    redirect_to cart_path(cart), notice: "カートに追加しました"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart), notice: "カートから削除しました"
  end
end
