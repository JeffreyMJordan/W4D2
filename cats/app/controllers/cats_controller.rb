class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    @rentals = @cat.rentals
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    cat_params.each do |k, v|
      @cat[k] = v
    end

    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages
    end
  end

  private
    def cat_params
      params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end

end
