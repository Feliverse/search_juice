class SearchesController < ApplicationController
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
  
  def statistics
    @most_common_searches = SearchQuery.group(:query).count
  
    @top_searches = @most_common_searches.sort_by { |_query, count| -count }.take(5)
  
    puts "Top searches: #{@top_searches}" # Esto imprimirá en la consola de Rails
    logger.debug "Top searches: #{@top_searches}" # Esto también lo puedes ver en los logs
  end

end