class LineItemsController < ApplicationController
  include AccessCounter

  before_action :set_line_item, only: %i[ show edit update destroy ]
  after_action :access_count_reset, only: [:create]

  # GET /line_items or /line_items.json
  def index
    @line_items = @cart.line_items
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(line_item_params[:product_id])
    @line_item = LineItem.find_by(cart_id: @cart.id, product_id: product.id)

    if @line_item.nil?
      @line_item = @cart.line_items.build(product: product)
    else
      @line_item.quantity += 1
    end

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        @line_items = @cart.line_items
        format.js
        format.html { redirect_to line_item_url(@line_item), notice: "Line Item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    @line_items = @cart.line_items
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "Line Item was successfully destroyed." }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity)
  end
end
