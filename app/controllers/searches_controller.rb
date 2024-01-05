class SearchesController < ApplicationController
  def search
    @results = 
    Article.where("column_name LIKE ?", "%#{params[:query]}%")
  end
  def process_search
    @query = params[:query]
    record_search(@query)

    @articles = Article.where("title LIKE ? OR body LIKE ?", "%#{@query}%", "%#{@query}%")
    render 'searches/process_search', articles: @articles, query: @query
  end

  private

  def record_search(query)
    return if query.blank? || query.split.size <= 3 # Ignorar consultas cortas o incompletas

    # Lógica para almacenar consultas relevantes
    SearchQuery.create(query: query, ip_address: request.remote_ip)
  end
end