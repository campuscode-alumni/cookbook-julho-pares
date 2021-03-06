class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update]
  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    return redirect_to @recipe if @recipe.save

    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    render :new
  end

  def edit
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update
    return redirect_to @recipe if @recipe.update(recipe_params)

    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
    render :edit
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                   :difficulty, :cook_time, :ingredients,
                                   :cook_method)
  end
end
