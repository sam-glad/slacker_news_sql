require 'sinatra'
require 'pg'
require 'pry'
require './helper_methods.rb'

def get_articles
  # connection = PG.connect(dbname: 'slacker_articles')
  # # results = connection.exec('QUERY GOES HERE')
  # connection.close

  articles = [
    {
      :title => "Article Title",
      :url => "www.google.com",
      :description => "This is a Google"
     }
  ]

  articles
end

get '/' do
  @articles = get_articles
  erb :index
  # TODO Print list of articles
end

get '/articles/new' do
  # TODO form page
end
