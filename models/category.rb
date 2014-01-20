class Category
  attr_accessor :name, :recipes, :id

  def initialize(params)
    @id = params.fetch('id')
    @name = params.fetch('name')
    @recipes = []
  end

end

