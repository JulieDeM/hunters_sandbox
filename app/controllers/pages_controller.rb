class PagesController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @message = "welcome"
  end

  def profile2
    @current_user = current_user
  end

  def edit
  end

  def create
    personal_params = pages_params.merge(user_id: current_user.id)
    @pages = Product.new(personal_params)

    respond_to do |format|
      if @pages.save
        format.html { redirect_to @product, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @pages }
      else
        format.html { render :new }
        format.json { render json: @pages.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    # respond_to do |format|
    #   if @product.update(product_params)
    #     format.html { redirect_to @product, notice: 'Product was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @product }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # @product.destroy
    # respond_to do |format|
    #   format.html { redirect_to pages_url, notice: 'Product was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end
end
