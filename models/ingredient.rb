class Ingredient
  attr_accessor :name, :id

  def initialize(params)
    @id = params.fetch('id')
    @name = params.fetch('name')
  end

end
