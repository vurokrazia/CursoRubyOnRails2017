class MyimagesController < ApplicationController
    load_and_authorize_resource
  before_action :set_product

  def show
  end

  def new
    @myimage = Myimage.new
  end

  def edit
  end

  def create

    @myimage = @product.myimages.new(myimage_params)

    respond_to do |format|
      if @myimage.save
        format.html { redirect_to @myimage.product, notice: 'Myimage was successfully created.' }
        format.json { render :show, status: :created, location: @myimage }
      else
        format.html { render :new }
        format.json { render json: @myimage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @myimage.update(myimage_params)
        format.html { redirect_to @myimage.product, notice: 'Myimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @myimage }
      else
        format.html { render :edit }
        format.json { render json: @myimage.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @myimage.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Myimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_myimage
      @myimage = Myimage.find(params[:id])
    end

    def myimage_params
      params.require(:myimage).permit(:img, :title, :description)
    end
    def set_product
      @product = Product.find(params[:product_id])
    end
end
