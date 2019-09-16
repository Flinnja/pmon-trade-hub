class TypesController < ApplicationController
  def index
  	@types = Type.all
  end

  def show
  	@type = Type.find(params[:id])
  end

  def new
  	@type = Type.new
  end

  def create
  	@type = Type.new
  	@type.assign_attributes(type_params)

  	if @type.save
  		redirect_to type_path(@type), notice: "Type created"
  	else
  		render :new
  	end
  end

  def edit
  	@type = Type.find(params[:id])
  end

  def update
  	@type = Type.find(params[:id])
  	@type.assign_attributes(type_params)
  	if @type.save
  		redirect_to type_path(@type), notice: "Type edited"
  	else
  		render :edit
  	end
  end

  def destroy
  	@type = Type.find(params[:id])

  	if @type.destroy
  		redirect_to types_path, notice: "Type deleted"
  	else
  		redirect_to type_path(@type), notice: "Unable to delete Type"
  	end
  end

  private
  def type_params
  	params.require(:type).permit(:name)
  end
end
