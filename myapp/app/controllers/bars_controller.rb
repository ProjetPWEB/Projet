class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]

  # GET /bars
  # GET /bars.json
  def index
    @bars = Bar.all
    render json: @bars
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
  end

  def my_bar
    @my_bar = Bar.all
  end

  # GET /bars/new
  def new
    @bar = Bar.new
  end

  # GET /bars/1/edit
  def edit
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(bar_params)

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bar }
      else
        format.html { render action: 'new' }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bars/1
  # PATCH/PUT /bars/1.json
  def update
    respond_to do |format|
      if @bar.update(bar_params)
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar.destroy
    respond_to do |format|
      format.html { redirect_to bars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bar
      @bar = Bar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bar_params
      params.require(:bar).permit(:ingr, :quantity)
    end
end
