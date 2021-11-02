class SupermarketsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :movement, only: [ :show, :edit, :update, :destroy]
  before_action :prohibit, only: [:edit, :update, :destroy]


  def index
    @supermarkets = Supermarket.all.order("created_at DESC")
  end

  def new
    @supermarket = Supermarket.new
  end

  def create
    @supermarket = Supermarket.new(supermarket_params)
    if @supermarket.save
      redirect_to supermarket_path(@supermarket.id)
    else
      render :new
    end
  end

  def show
  end

  def edit 
  end

  def update 
    if @supermarket.update(supermarket_params)
      redirect_to supermarket_path(@supermarket.id)
    else
      render :edit
    end
  end

  def destroy
    if @supermarket.destroy
      redirect_to supermarkets_path(current_user)
    else
      render :index
    end
  end



  private

  def supermarket_params
    params.require(:supermarket).permit(:market, :market_url, :detail, :user).merge(user_id: current_user.id)
  end

  def movement 
    @supermarket = Supermarket.find(params[:id])
  end

  def prohibit
    redirect_to new_user_session_path unless current_user.id == @supermarket.user_id 
  end

end
