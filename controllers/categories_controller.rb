
get '/categories' do
  sql = "select * from categories"
  @categories = run_sql(sql).map { |b| Category.new(b) }
  erb :'categories/index'
end

get '/categories/new' do
  erb :'categories/new'
end

post '/categories' do
  sql = "insert into categories (name) values ('#{params['name']}')"
  run_sql(sql)
  redirect to('/categories')
end

get '/categories/:id/show' do
  sql = "select * from categories where id = #{params['id']}"
  @category = Category.new(run_sql(sql).first)
  erb :'categories/show'
end

get '/categories/:id/edit' do
  sql = "select * from categories where id = #{params['id']}"
  @category = Category.new(run_sql(sql).first)
  erb :'categories/edit'
end

post '/categories/:id' do
  sql = "update categories set name='#{params['name']}' where id = #{params['id']}"
  run_sql(sql)
  redirect to("/categories/#{params['id']}/show")
end

get '/categories/:id/delete' do
  sql = "delete from categories where id = #{params['id']}"
  run_sql(sql)
  redirect to('/categories')
end
