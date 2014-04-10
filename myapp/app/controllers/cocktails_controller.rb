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

  def search_by_bar
    @cocktails = []
    @mes_ingr = []
    Bar.all.each do |b|
      if b.user==current_user
        @mes_ingr << b.ingredient
      end
    end
    puts "Mon Bar"
    puts @mes_ingr[0].name
    puts @mes_ingr[1].name
    puts @mes_ingr[2].name
    puts "Mon Bar Trié"
    @mes_ingr.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    puts @mes_ingr[0].name
    puts @mes_ingr[1].name
    puts @mes_ingr[2].name

    Cocktail.all.each do |c|
      @cocktail_ingr = []
      puts "Cocktail"
      puts c.name
      c.components.each do |compo|
        @cocktail_ingr << compo.ingredient 
      end
      @cocktail_ingr.sort! { |a,b| a.name.downcase <=> b.name.downcase }
      if @cocktail_ingr == @mes_ingr
        puts "Ce Cocktail a les meme ingrédients que moi, on l'ajoute"
        @cocktails<<c
      else
        if @cocktail_ingr.length < @mes_ingr.length
          bool_res = true
          @cocktail_ingr.each do |ci|
            if @mes_ingr.include? ci
              bool_res = bool_res & true
            else
              bool_res = bool_res & false
            end
          end  
        end
        if bool_res == true
          @cocktails << c
        end
      end
    end
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    allcomps = []
    for i in 0..(params[:cocktail][:components].length-1)
          foundingr = (Ingredient.find_by name:(params[:cocktail][:components][i].split(',')[0]))
          foundqtt = params[:cocktail][:components][i].split(',')[1]
          comparray = Hash.new
          comparray['ingredient'] = foundingr
          comparray['quantity'] = foundqtt
          comparray['cocktail'] = Cocktail.last
          puts "COMPONENT : "
          newcomponent = Component.new(comparray)
          puts newcomponent.ingredient.name
          puts newcomponent.quantity
          allcomps << newcomponent
    end
    params.require(:cocktail).permit(:name, :description, :rating, {:components => []})
    newparams=cocktail_params.merge({user: current_user})
    @cocktail = Cocktail.new(newparams)
    
    respond_to do |format|
      if @cocktail.save
        allcomps.each do |c|
          Cocktail.last.components << c
        end
        format.html { redirect_to @cocktail, notice: 'Cocktail créé avec succès.' }
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
        format.html { redirect_to @cocktail, notice: 'Cocktail mis à jour avec succès.' }
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
