class WelcomeController < ApplicationController
  def index
    @results = search
  end

  private

    def search_params
      params.permit(:song, :album, :artist)
    end

    def search
      search_single_field
    end

    def search_single_field
      if single_search?(search_params[:song], search_params[:album], search_params[:artist])
        search_song
      elsif single_search?(search_params[:album], search_params[:song], search_params[:artist])
        search_album
      elsif single_search?(search_params[:artist], search_params[:album], search_params[:song])
        search_artist
      end
    end

    def single_search?(filled, blank, blank2)
      !filled.empty? && blank.empty? && blank2.empty?
    end

    def search_song
      Song.search(search_params[:song])
    end

    def search_album
      Album.search(search_params[:album])
    end

    def search_artist
      Artist.search(search_params[:artist])
    end
end
