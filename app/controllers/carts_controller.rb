class CartsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def show
    @store = Store.find(params[:store_id])
  end

  def add_item
    @store = Store.find(params[:store_id])
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, @store, +1)

    redirect_back fallback_location: root_path
  end 

  def remove_item
    @store = Store.find(params[:store_id])
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, @store, -1)

    redirect_back fallback_location: root_path
  end

  private

  def modify_cart_delta(product_id, store, delta)
    cart(store)[product_id] = (cart(store)[product_id] || 0) + delta
    cart(store).delete(product_id) if cart(store)[product_id] < 1
    update_cart cart(store)
  end

end
