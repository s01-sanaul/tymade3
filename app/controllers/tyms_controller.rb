class TymsController < ApplicationController

  def index
    @tyms = Tym.all
  end

  def show
    @tym = Tym.find_by(id: params[:id])
  end

  def new
  end

  def create
    @tym = Tym.new
    @tym.end = params[:end]
    @tym.hw = params[:hw_hr]+":"+params[:hw_min]
    @tym.sleep = params[:sleep]
    @tym.start = params[:start]
     #@tym.free = params[:free]
    
    if @tym.save
      redirect_to "/tyms/#{ @tym.id }"
    else
      render 'new'
    end
  end

  def edit
    @tym = Tym.find_by(id: params[:id])
  end

  def update
    @tym = Tym.find_by(id: params[:id])
    if params[:end] != ""
      @tym.end = params[:end]
    end
    if params[:hw_hr] != "" && params[:hw_min] != ""
      @tym.hw = params[:hw_hr]+":"+params[:hw_min]
    end
    if params[:sleep] != ""
      @tym.sleep = params[:sleep]
    end 
    if params[:start] != ""
      @tym.start = params[:start]
    end

    if @tym.save
      redirect_to "/tyms/#{ @tym.id }"
    else
      render "edit"
    end
  end

  def destroy
    @tym = Tym.find_by(id: params[:id])
    @tym.destroy


    redirect_to "/tyms"
  end
end
