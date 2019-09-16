class TypessController < ApplicationController
  def index
  	@types = Types.all
  end

  def show
  	@type = Types.find(params[:id])
  end

  def new
  	@type = Types.new
  end

  def create
  	@type = Types.new
  	@type.assign_attributes(type_params)

  	if @type.save
  		redirect_to type_path(@type), notice: "Type created"
  	else
  		render :new
  	end
  end

  def edit
  	@type = Types.find(params[:id])
  end

  def update
  	@type = Types.find(params[:id])
  	@type.assign_attributes(type_params)
  	if @type.save
  		redirect_to type_path(@type), notice: "Type edited"
  	else
  		render :edit
  	end
  end

  def destroy
  	@type = Types.find(params[:id])

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
