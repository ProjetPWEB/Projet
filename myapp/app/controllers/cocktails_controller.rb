class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /cocktails
  # GET /cocktails.json
  def index
    @cocktails = Cocktail.all
  #render json: @cocktails
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # GET /cocktails/1/edit
  def edit
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    params.require(:cocktail).permit(:name, :description, :rating, {:component => []})
    @cocktail = Cocktail.new(cocktail_params.merge(user: current_user))

	for i in 0..(params[:cocktail][:component].length-1)
		foundingr = (Ingredient.find_by name:(params[:cocktail][:component][i].split(',')[0]))
		foundqtt = params[:cocktail][:component][i].split(',')[1]
		comparray = Hash.new
		comparray['ingr'] = foundingr
		comparray['quantity'] = foundqtt
		comparray['cocktail'] = Cocktail.last
		#newcomponent = Component.new(comparray)
		Cocktail.last.component.create(comparray)
	end
	puts '\n ICI \n '
	puts Cocktail.last.component
 	puts '\n CIC \n '
 
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cocktail }
      else
        format.html { render action: 'new' }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cocktails/1
  # PATCH/PUT /cocktails/1.json
  def update
    respond_to do |format|
      if @cocktail.update(cocktail_params)
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cocktails/1
  # DELETE /cocktails/1.json
  def destroy
    @cocktail.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :description, :rating, :components)
    end
end
