
get '/ingredients' do
  sql = "select * from ingredients"
  @ingredients = run_sql(sql).map { |b| Ingredient.new(b) }
  erb :'ingredients/index'
end

get '/ingredients/new' do
  erb :'ingredients/new'
end

post '/ingredients' do
  sql = "insert into ingredients (name) values ('#{params['name']}')"
  run_sql(sql)
  redirect to('/ingredients')
end

get '/ingredients/:id/show' do
  sql = "select * from ingredients where id = #{params['id']}"
  @category = Ingredient.new(run_sql(sql).first)
  erb :'ingredients/show'
end

get '/ingredients/:id/edit' do
  sql = "select * from ingredients where id = #{params['id']}"
  @category = Ingredient.new(run_sql(sql).first)
  erb :'ingredients/edit'
end

post '/ingredients/:id' do
  sql = "update ingredients set name='#{params['name']}' where id = #{params['id']}"
  run_sql(sql)
  redirect to("/ingredients/#{params['id']}/show")
end

get '/ingredients/:id/delete' do
  sql = "delete from ingredients where id = #{params['id']}"
  run_sql(sql)
  redirect to('/ingredients')
end
