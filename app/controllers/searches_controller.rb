class SearchesController < ApplicationController
  def search
    @results = 
    Article.where("column_name LIKE ?", "%#{params[:query]}%")
  end
  def process_search
    @query = params[:query]
    @articles = Article.where("title LIKE ? OR body LIKE ?", "%#{@query}%", "%#{@query}%")
  end
end