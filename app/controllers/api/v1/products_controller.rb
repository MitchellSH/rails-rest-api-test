class Api::V1::ProductsController < ApplicationController

  # GET /products
  def show
    @product = Product.all
    render json: @product
  end

  # POST /product
  def new
    @product = Product.new(product_params)
    if @product.save
      render json: @product
    else
      render error: { error: 'Unable to create Product.' }, status: 400
    end
  end

  private

  def product_params
    params.permit(:name)
  end

end
