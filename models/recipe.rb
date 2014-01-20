class Recipe
  attr_accessor :name, :id, :description, :instructions, :published_on, :category_id, :image, :serving_size

  def initialize(params)
    @id = params.fetch('id')
    @name = params.fetch('name')
    @description = params.fetch('description')
    @instructions = params.fetch('instructions') 
    @published_on = params.fetch('published_on') 
    @category_id = params.fetch('category_id')
    @image = params.fetch('image') 
    @serving_size = params.fetch('serving_size')
  end

end