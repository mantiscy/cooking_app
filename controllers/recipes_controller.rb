
get '/recipes' do
  sql = "select * from recipes"
  @recipes = run_sql(sql).map { |e| Recipe.new(e) }

  erb :'recipes/index'
end

get '/recipes/new' do
  sql = "select * from categories"
  @categories = run_sql(sql).map { |e| Category.new(e) }

  sql = "select * from ingredients"
  @ingredients = run_sql(sql).map { |e| Ingredient.new(e) }

  erb :'recipes/new'
end

post '/recipes' do
  params['published_on'] = params['published_on'] ? Date.today : (Date.parse(params['published_on']) rescue Date.today)

  sql = "insert into recipes (name, description, instructions, published_on) values (
    '#{params['name']}',
    '#{params['description']}',
    '#{params['instructions']}',
    '#{params['published_on'].strftime("%Y-%m-%d")}'
    ) returning *"
  recipe = Recipe.new(run_sql(sql).first)

  if params[:ingredient_ids]
    params[:ingredient_ids].each do |ingredient_id|
      sql = "INSERT INTO ingredients_recipes (ingredient_id, recipe_id) values (#{ingredient_id}, #{recipe.id})"
      run_sql(sql)
    end
  end

  if params[:category_ids]
    params[:category_ids].each do |category_id|
      sql = "INSERT INTO categories_recipes (category_id, recipe_id) values (#{category_id}, #{recipe.id})"
      run_sql(sql)
    end
  end

  redirect to('/recipes')
end

get '/recipes/:id/show' do
  sql = "select * from recipes where id = #{params['id']}"
  @recipe = Recipe.new(run_sql(sql).first)

  sql = "select * from ingredients i join ingredients_recipes ir on ir.ingredient_id = i.id where ir.recipe_id = #{@recipe.id}"
  @recipe.ingredients = run_sql(sql).map { |e| Ingredient.new(e) }

  sql = "select * from categories c join categories_recipes cr on cr.category_id = c.id where cr.recipe_id = #{@recipe.id}"
  @recipe.categories = run_sql(sql).map { |c| Category.new(c) }

  erb :'recipes/show'
end

get '/recipes/:id/edit' do
  sql = "select * from recipes where id = #{params['id']}"
  @recipe = Recipe.new(run_sql(sql).first)

  sql = "select * from categories"
  @categories = run_sql(sql).map { |e| Category.new(e) }

  sql = "select * from ingredients"
  @ingredients = run_sql(sql).map { |e| Ingredient.new(e) }

  sql = "select * from ingredients i join ingredients_recipes ir on ir.ingredient_id = i.id where ir.recipe_id = #{@recipe.id}"
  @recipe.ingredients = run_sql(sql).map { |e| Ingredient.new(e) }

  sql = "select * from categories c join categories_recipes cr on cr.category_id = c.id where cr.recipe_id = #{@recipe.id}"
  @recipe.categories = run_sql(sql).map { |c| Category.new(c) }

  erb :'recipes/edit'
end

post '/recipes/:id' do
  params['published_on'] = params['published_on'] ? Date.today : (Date.parse(params['published_on']) rescue Date.today)

  sql = "update recipes set
    name = '#{params['name']}',
    description = '#{params['description']}',
    instructions = '#{params['instructions']}',
    published_on = '#{params['published_on'].strftime("%Y-%m-%d")}'
    where
    id = #{params['id']}
    "
  run_sql(sql)

  sql = "DELETE FROM ingredients_recipes where recipe_id = #{params['id']}"
  run_sql(sql)

  if params[:ingredient_ids]
    params[:ingredient_ids].each do |ingredient_id|
      sql = "INSERT INTO ingredients_recipes (ingredient_id, recipe_id) values (#{ingredient_id}, #{params['id']})"
      run_sql(sql)
    end
  end

  sql = "DELETE FROM categories_recipes where recipe_id = #{params['id']}"
  run_sql(sql)

  if params[:category_ids]
    params[:category_ids].each do |category_id|
      sql = "INSERT INTO categories_recipes (category_id, recipe_id) values (#{category_id}, #{params['id']})"
      run_sql(sql)
    end
  end

  redirect to("/recipes/#{params['id']}/show")
end

get '/recipes/:id/delete' do
  sql = "delete from recipes where id = #{params['id']}"
  sql = "
    delete from recipes where id = #{params['id']};
    delete from ingredients_recipes where recipe_id = #{params['id']};
    delete from categories_recipes where recipe_id = #{params['id']};
  "
  run_sql(sql)
  redirect to('/recipes')
end
