class StoresController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :new, :create]

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = current_user.stores.build(store_params)
    if @store.save
      redirect_to '/users'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @logged_in_user = current_user
    @store = Store.find(params[:id])
    @category = Category.new(store_id:@store.id)
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end

end
