class IngredientController < ApplicationController   
  def list
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
    @recipes = Recipe.all
  end

  def create
    @ingredient = Ingredient.new(recipe_params)
    if @ingredient.save
      redirect_to action: 'list'
    else
      @recipes = Recipe.all
      render action: 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipes = Recipe.all
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(recipe_param)
      redirect_to action: 'show', id: @ingredient
    else
      @recipes = Recipe.all
      render action: 'edit'
    end
  end

  def delete
    Ingredient.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  def recipe_param
    params.require(:ingredient).permit(:name)
  end

  def recipe_params
    params.require(:ingredients).permit(:name)
  end

  def show_recipes
    @recipe = Recipe.find(params[:id])
  end
end
