class ProductsController < ApplicationController
  before_action :logged_in_user

  def show
  end

  def new 
    @product = Product.new
    @category = Category.find(params[:category_id])
    @store = Store.find(params[:store_id])
    if !current_user.stores.include?(@store)
      redirect_to '/login'
    end
  end

  def create
    @store = Store.find(params[:store_id])
    @category = Category.find(params[:category_id])
    @product = @category.products.build(product_params)
    @store.products << @product
    if current_user.stores.include?(@store)
      if !@product.save
        redirect_back fallback_location: root_path
      else 
        @product_category_join = ProductsCategoriesJoin.create(product_id:@product.id, category_id:@category.id)
        if !@product_category_join.save
          redirect_back fallback_location: root_path
        else 
          redirect_to @store
        end
      end
    else 
      redirect_to '/login'
    end
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price_cents, :picture)
  end

end
