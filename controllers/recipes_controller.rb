
get '/recipes' do
  sql = "select * from recipes"
  @recipes = run_sql(sql).map { |b| Recipe.new(b) }
  erb :'recipes/index'
end

get '/recipes/new' do
  erb :'recipes/new'
end

post '/recipes' do
  sql = "insert into recipes (name) values ('#{params['name']}')"
  run_sql(sql)
  redirect to('/recipes')
end

get '/recipes/:id/show' do
  sql = "select * from recipes where id = #{params['id']}"
  @recipe = Recipe.new(run_sql(sql).first)
  erb :'recipes/show'
end

get '/recipes/:id/edit' do
  sql = "select * from recipes where id = #{params['id']}"
  @recipe = Recipe.new(run_sql(sql).first)
  erb :'recipes/edit'
end

post '/recipes/:id' do
  sql = "update recipes set name='#{params['name']}' where id = #{params['id']}"
  run_sql(sql)
  redirect to("/recipes/#{params['id']}/show")
end

get '/recipes/:id/delete' do
  sql = "delete from recipes where id = #{params['id']}"
  run_sql(sql)
  redirect to('/recipes')
end
