require "net/http"
require "uri"

class ReaderController < ApplicationController
  protect_from_forgery

  
	def index

    feedUrl = {
      :hotentry => "http://feeds.feedburner.com/hatena/b/hotentry",
      :entrylist => "http://b.hatena.ne.jp/entrylist?mode=rss",
      :social => "http://b.hatena.ne.jp/entrylist/social?mode=rss",
      :economics => "http://b.hatena.ne.jp/entrylist/economics?mode=rss",
      :life => "http://b.hatena.ne.jp/entrylist/life?mode=rss",
      :knowledge => "http://b.hatena.ne.jp/entrylist/knowledge?mode=rss",
      :it => "http://b.hatena.ne.jp/entrylist/it?mode=rss",
      :entertainment => "http://b.hatena.ne.jp/entrylist/entertainment?mode=rss",
      :game => "http://b.hatena.ne.jp/entrylist/game?mode=rss",
      :fun => "http://b.hatena.ne.jp/entrylist/fun?mode=rss"
    }

    url = feedUrl[params[:type].to_sym]
    uri = URI.parse(url)

    # Shortcut
    response = Net::HTTP.get_response(uri)

    #Net::HTTP.get_print(uri)

    @feeds = Feed.parse(response.body)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feeds }
    end
	end

	def new
    @memo = Feed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed }
    end
  end
end
