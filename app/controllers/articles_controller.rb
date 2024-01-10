class ArticlesController < ApplicationController
  def index
    if query_param.present? 
      search_create if query_param.length >= 2
      @articles = Article.search_title(query_param).limit(50)
    else
      @articles = Article.limit(9)
    end
  end

  private

  def search_create
    if latest_search.nil? || !matched_articles(latest_search&.query, query_param)
      Search.create(query: query_param.strip, user: current_user)
    else
      latest_search.update(query: query_param)
    end
  end

  def latest_search
    @latest_search ||= Search.latest_search(current_user)
  end

  def query_param
    params[:query]&.strip
  end

  def create_new_search_record
    Search.create(query: query_param, user: current_user, ip_address: current_user.ip_address)
  end
  
  def update_existing_search_record
    latest_search&.update(query: query_param)
  end

  def matched_articles(str1, str2)
    winkler = Amatch::JaroWinkler.new(str1)
    similarity_distance = winkler.match(str2)
    similarity_distance > 0.7
  end
end
