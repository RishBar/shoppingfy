class ProductsController < ApplicationController

  def show
  end

  def new 
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def create 
    @category = Category.find(params[:category_id])
    @product = @category.products.build(product_params)
    if !@product.save
      redirect_to '/new'
    else 
      @product_category_join = ProductsCategoriesJoin.create(product_id:@product.id, category_id:@category.id)
      if !@product_category_join.save
      redirect_to '/new'
      else 
        redirect_to '/users'
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price_cents)
  end

end
