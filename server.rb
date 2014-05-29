require 'sinatra'
# require 'sinatra/contrib/all'
require 'pg'
require 'pry'
require './helper_methods.rb'

def get_articles
  connection = PG.connect(dbname: 'slacker_articles')
  articles = connection.exec('SELECT * FROM articles ORDER BY articles.created_at DESC')
  connection.close

  articles
end

def post_article(title, url, description)
  sql = 'INSERT INTO articles (title, url, description, created_at) VALUES ($1, $2, $3, NOW())'

  connection = PG.connect(dbname: 'slacker_articles')
  connection.exec_params(sql, [title, url, description])
  connection.close
end

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = get_articles
  erb :index
end

get '/articles/new' do
  erb :form_page
end

post '/articles/new' do
  post_article(params["title"], params["url"], params["description"])
  redirect '/articles'
end
