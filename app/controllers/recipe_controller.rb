class RecipeController < ApplicationController
  def list
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to action: 'list'
    else
      @subjects = Subject.all
      render action: 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_param)
      redirect_to action: 'show', id: @recipe
    else
      @subjects = Subject.all
      render action: 'edit'
    end
  end

  def delete
    Recipe.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  def recipe_param
    params.require(:recipe).permit(:ingredients, :name, :instructions)
  end

  def recipe_params
    params.require(:recipes).permit(:ingredients, :name, :instructions)
  end
end
