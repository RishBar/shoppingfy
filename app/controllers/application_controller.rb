class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  # Confirms a logged-in emcee.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "log in."
      redirect_to '/login'
    end
  end

  def cart(store)
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]).except("12") : { store_id: { store.id.to_s => store.id} }
  end
  helper_method :cart

  def enhanced_cart(store)
    @enhanced_cart ||= store.products.where(id: cart(store).keys).map {|product| { product:product, quantity: cart(store)[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents(store)
    enhanced_cart(store).map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
