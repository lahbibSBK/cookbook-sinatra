class Recipe
  attr_accessor :name, :description, :cooking_time, :difficulty, :status

  def initialize(name, description, cooking_time, difficulty, status)
    @name = name
    @description = description
    @cooking_time = cooking_time
    @difficulty = difficulty
    @status = status
  end
end
