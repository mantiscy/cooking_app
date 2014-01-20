require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative 'models/category'
require_relative 'controllers/categories_controller'
require_relative 'models/ingredient'
require_relative 'controllers/ingredients_controller'
require_relative 'models/recipes'
require_relative 'controllers/recipes_controller'


before do
end


get '/' do
  erb :home
end



def run_sql(sql)
  conn = PG.connect(dbname: 'sinatra_cookbook', host: 'localhost')
  result = conn.exec(sql)
  conn.close
  result
end