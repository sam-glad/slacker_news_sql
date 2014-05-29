require 'sinatra'
require 'pg'
require 'pry'
require './helper_methods.rb'

def get_articles
  connection = PG.connect(dbname: 'slacker_articles')
  articles = connection.exec('SELECT * FROM articles
                                ORDER BY articles.created_at DESC')
  connection.close

  articles
end

get '/' do
  @articles = get_articles
  erb :index
end

get '/articles/new' do
  # TODO form page
end
