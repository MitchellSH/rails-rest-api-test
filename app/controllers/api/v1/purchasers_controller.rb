class Api::V1::PurchasersController < ApplicationController

  # GET /purchasers
  def show
    @purchaser = Purchaser.all
    render json: @purchaser
  end

  # POST /purchaser
  def new
    @purchaser = Purchaser.new(purchaser_params)
    if @purchaser.save
      render json: @purchaser
    else
      render error: { error: 'Unable to create Purchaser.' }, status: 400
    end
  end

  # POST /purchaser-product
  def purchase
    @purchaser = Purchaser.find(params[:purchaser_id])
    @product = Product.find(params[:product_id])
    @time = DateTime.now

    if @product && @purchaser
      @product.update(:purchaser_id => @purchaser[:id], :purchase_timestamp => @time)
      render json: { message: 'Product successfully purchased by ' + @purchaser[:name] + '.'}, status: 200
    else
      render json: {error: 'Unable to purchase Product.'}, status: 400
    end
  end

  # GET /purchaser/{$purchaser_id}/product?start_date={$start_date}&end_date={$end_date}
  def purchases
    @purchaser = Purchaser.find(purchaser_params[:purchaser_id])
    @start = params[:start_date]
    @end = params[:end_date]

    if @start && @end
      @products = Product.where(:purchaser_id => @purchaser[:id], :purchase_timestamp => @start..@end)
      @purchases = { 'purchases' => {} }

      @products.as_json(:root => false).map do |item|
        @date = DateTime.parse(item["purchase_timestamp"]).strftime("%Y-%m-%d")
        if @purchases["purchases"][@date]
          @purchases["purchases"][@date] << { 'product' => item["name"] }
        else
          @purchases["purchases"][@date] = []
          @purchases["purchases"][@date] << { 'product' => item["name"] }
        end
      end

      render json: @purchases

    else
      render json: {error: 'Unable to find list of Products due to no start and end dates or dates invalid.'}, status: 400
    end
  end

  private

  def purchaser_params
    params.permit(:name, :purchaser_id, :start_date, :end_date)
  end

end
