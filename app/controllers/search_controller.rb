class SearchController < ApplicationController
    def index
      @results = search_for_articles
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('articles', partial: 'articles/articles', locals: { articles: @results })
        end
      end
        search_create if query_param.length >= 2
    end

    def suggestions
      @results = search_for_articles
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('articles', partial: 'search/suggestions', locals: { results: @results })
        end
      end
    end

    def recent_searches_by_user
    end    

    private

    def search_create
      latest_search_record = latest_search
    
      if latest_search_record.nil? || !matched_articles(latest_search_record.query, query_param)
        Search.create(query: query_param.strip, user: current_user)
      else
        latest_search_record.update(query: query_param)
      end
    end
    
    def latest_search
      @latest_search ||= Search.latest_search(current_user)
    end

    def query_param
      params[:query]&.strip
    end

    def matched_articles(str1, str2)
      winkler = Amatch::JaroWinkler.new(str1)
      similarity_distance = winkler.match(str2)
      similarity_distance > 0.7
    end
    
    def search_for_articles
      if params[:query].blank?
        Article.all
      else
        Article.search(params[:query], fields: %i[title, body], operator: "or", match: :text_middle)
      end
    end
  end