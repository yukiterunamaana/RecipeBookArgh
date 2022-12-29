class UserController < ApplicationController
  def list
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: 'list'
    else
      @subjects = Subject.all
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(recipe_param)
      redirect_to action: 'show', id: @user
    else
      @subjects = Subject.all
      render action: 'edit'
    end
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  def user_param
    params.require(:user).permit(:nickname, :email, :password)
  end

  def user_params
    params.require(:users).permit(:nickname, :email, :password)
  end

  def show_recipes
    @recipe = Recipe.find(params[:id])
  end
end
