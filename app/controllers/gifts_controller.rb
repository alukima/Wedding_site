class GiftsController < ApplicationController
	def index
    @gifts = Guest.all
  end

  def show
    @gift = Guest.find(params[:id])
  end

  def new
    @gift = Guest.new
  end

  def edit
    @gift = Guest.find(params[:id])
  end

  def create
    @gift = Guest.new(params[:Guest])
    
  end

  def update
    @gift = Guest.find(params[:id])
  end

  def destroy
    @gift = Guest.find(params[:id])
    @gift.destroy
  end

end
