class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    @cats = Cat.all
  end

  def create
    @request = CatRentalRequest.new(cat_request_params)
    if @request.save
      redirect_to cat_url(cat_request_params[:cat_id])
    else
      render json: @request.errors.full_messages
    end
  end


  private
  def cat_request_params
    params.require(:cat_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
