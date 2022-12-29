class RecipeController < ApplicationController
  def list
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @users = User.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to action: 'list'
    else
      @users = User.all
      render action: 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @users = User.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_param)
      redirect_to action: 'show', id: @recipe
    else
      @users = User.all
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

  def show_users
    @user = User.find(params[:id])
  end
end
