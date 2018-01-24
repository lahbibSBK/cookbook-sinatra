require_relative 'view'
require_relative 'recipe'
require_relative 'cookbook'
require_relative 'parsing'

class Controller
  attr_reader :recipes

  def initialize(cookbook)
    # takes an instance of the Cookbook as an argument.
    @cookbook = cookbook
    @view = View.new
    @parsing = Parsing.new
  end

  def list
    @view.list(@cookbook.all)
  end

  def create
    nametab = @view.add_recipe
    # Create the recipe
    recipe = Recipe.new(nametab[0], nametab[1], nametab[2], nametab[3])
    # Save the recipe to DB
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.list(@cookbook.all)
    recipe_index = @view.remove.to_i - 1
    # destroy the recipe
    @cookbook.remove_recipe(recipe_index)
  end

  def import
    recup_ingredient_difficult = @view.ingredient_html
    tabres = @parsing.import_ingredient(recup_ingredient_difficult[0], recup_ingredient_difficult[1])
    i = @view.import_choice(recup_ingredient_difficult[0], tabres).to_i
    if i != 0
      recipe = Recipe.new(tabres[i - 1][:titre], tabres[i - 1][:description],
                          tabres[i - 1][:time], tabres[i - 1][:difficulty], tabres[i - 1][:status])
      @cookbook.add_recipe(recipe)
    end
  end

  def done
    @view.list(@cookbook.all)
    recipe_index = @view.recipe_done_choice.to_i - 1
    # Change the recipe status
    @cookbook.recipe_done(recipe_index)
  end
end
