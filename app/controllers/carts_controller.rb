class CartsController < ApplicationController

  def index
  end

  def show
    @current_cart = current_user.current_cart
  end

  def checkout
    @current_cart = Cart.find(current_user.current_cart_id)
    @current_cart.line_items.each do |line_item|
      Item.find(line_item.item_id).decrement(:inventory, line_item.quantity).save
    end
    @current_cart.status = "submitted"
    @current_cart.save
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path(@current_cart)
  end

end
