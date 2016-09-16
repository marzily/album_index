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
      s_songs = single
      d_songs = double
      t_songs = tripple

      s_songs || d_songs || t_songs
    end

    def tripple
      if tripple?(search_params[:song], search_params[:album], search_params[:artist])
        songs = search_song
        songs = songs.select { |song| song.album.lowercase_title == search_params[:album].downcase }
        songs = songs.select { |song| song.artist.lowercase_name == search_params[:artist].downcase }
      end
    end

    def tripple?(filled, filled2, filled3)
      !filled.empty? && !filled2.empty? && !filled3.empty?
    end

    def double
      if double?(search_params[:song], search_params[:album], search_params[:artist])
        songs = search_song
        songs.select { |song| song.album.lowercase_title == search_params[:album].downcase }
      elsif double?(search_params[:song], search_params[:artist], search_params[:album])
        songs = search_song
        songs.select { |song| song.artist.lowercase_name == search_params[:artist].downcase }
      elsif double?(search_params[:album], search_params[:artist], search_params[:song])
        songs = search_album
        songs.select { |song| song.artist.lowercase_name == search_params[:artist].downcase }
      end
    end

    def double?(filled, filled2, blank)
      !filled.empty? && !filled2.empty? && blank.empty?
    end

    def single
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
