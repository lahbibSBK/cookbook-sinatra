class View
  def list(recipes)
    recipes.each_with_index do |recipe, index|
      recipe.status == "true" ? x = "X" : x = " "
      puts "#{index + 1}. [#{x}] #{recipe.name} (#{recipe.cooking_time} - #{recipe.difficulty})"
    end
  end

  def add_recipe
    puts "What's the name of the recipe?"
    print "> "
    name = gets.chomp
    puts "What's the description of the recipe?"
    description = gets.chomp
    puts "What's the cooking time of the recipe?"
    time = gets.chomp
    puts "What's the difficulty of the recipe?"
    difficulty = gets.chomp
    [name, description, time, difficulty, false]
  end

  def remove
    puts "Which recipe? (give the index)"
    print "> "
    gets.chomp
  end

  def ingredient_html
    puts "Which ingredient would you like a recipe for?"
    print "> "
    ingredient_input = gets.chomp
    puts "Which difficulty do you want to choose (difficult/easy/Very easy/no = enter)?"
    print "> "
    difficulty_input = gets.chomp
    [ingredient_input, difficulty_input]
  end

  def import_choice(ingredient, tabres)
    puts "Looking for \"#{ingredient}\" on LetsCookFrench..."
    puts "#{tabres.size} results found!"
    puts "0 - Stop and exit the program"
    tabres.each_with_index { |elt, i| puts "#{i + 1} - #{elt[:titre]} - #{elt[:time]} - #{elt[:difficulty]}" }
    puts "Please type a number to choose which recipe to import"
    puts "> "
    gets.chomp
  end

  def recipe_done_choice
    puts "Which recipe is done?"
    print "> "
    gets.chomp
  end
end
