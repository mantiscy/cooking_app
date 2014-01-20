class Recipe
  attr_accessor :name, :description, :instructions, :published_on, :ingredients, :categories, :id

  def initialize(params)
    @id = params.fetch('id')
    @categories = []
    @description = params['description']
    @instructions = params['instructions']
    @published_on = params['published_on']
    @name = params.fetch('name')
    @ingredients = []
  end

end
