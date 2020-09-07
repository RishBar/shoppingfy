class CategoriesController < ApplicationController
  before_action :logged_in_user
  
  def show
  end

  def new 
  end

  def create
    @store = Store.find(params[:store_id])
    @category = @store.categories.build(category_params)
    if !@category.save
      redirect_to '/users'
    else 
      redirect_to @store
    end
  end

  def edit
  end

  def update
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
