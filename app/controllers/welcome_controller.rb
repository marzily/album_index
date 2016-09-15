class WelcomeController < ApplicationController
  def index
    if searchable?
      @results = search
    end
  end

  private

    def search_params
      params.permit(:song, :album, :artist)
    end

    def searchable?
      search_params.any? { |param| param }
    end

    def search
      single
      # d_songs = double

      # s_songs || d_songs
    end

    def double

      if double?(search_params[:song], search_params[:album], search_params[:artist])
        songs = search_album
        songs.select { |song| song.title == search_params[:song] }

      end

    end

    def double?(filled, filled2, blank)
      !filled.empty? && !filled2.empty? && blank.empty?
    end

    def single
      # byebug
      if single?(search_params[:song], search_params[:album], search_params[:artist])
        search_song
      elsif single?(search_params[:album], search_params[:song], search_params[:artist])
        search_album
      elsif single?(search_params[:artist], search_params[:album], search_params[:song])
        search_artist
      end
    end

    def single?(filled, blank, blank2)
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
