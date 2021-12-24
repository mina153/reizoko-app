class WantsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :movement, only: [ :show, :edit, :update, :destroy]
  before_action :prohibit, only: [:edit, :update, :destroy]


  def index
    @wants = Want.all.order("created_at DESC")
  end

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    if @want.save
      redirect_to want_path(@want.id)
    else
      render :new
    end
  end

  def show
  end

  def edit 
  end

  def update 
    if @want.update(want_params)
      redirect_to want_path(@want.id)
    else
      render :edit
    end
  end

  def destroy
    if @want.destroy
      redirect_to wants_path(current_user)
    else
      render :index
    end
  end



  private

  def want_params
    params.require(:want).permit(:wanted, :account, :categori_id,:user, :supermarket_id ).merge(user_id: current_user.id )
  end

  def movement 
    @want = Want.find(params[:id])
  end

  def prohibit
    redirect_to new_user_session_path unless current_user.id == @want.user_id 
  end
end
