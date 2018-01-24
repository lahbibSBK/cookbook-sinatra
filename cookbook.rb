require 'csv'
require_relative 'recipe'


class Cookbook
  attr_reader :recipes, :file_path

  def initialize(file_path)
    @recipes = []
    @file_path = file_path
    CSV.foreach(@file_path) do |row|
      recipe1 = Recipe.new(row[0], row[1], row[2], row[3], row[4])
      @recipes << recipe1
    end
  end

  def all
    # which returns all the recipies
    @recipes
  end

  def add_recipe(recipe)
    # which adds a new recipe to the cookbook
    @recipes << recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    # which removes a recipe from the cookbook.
    @recipes.delete_at(recipe_index)
    write_csv
  end

  def recipe_done(recipe_index)
    # which recipe from the cookbook is done.
    @recipes[recipe_index].status = !@recipes[recipe_index].status
    write_csv
  end

  private

  def write_csv
    CSV.open(@file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time, recipe.difficulty, recipe.status]
      end
    end
  end
end

# Cookbook.new('recipes.csv')
