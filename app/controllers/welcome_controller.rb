class WelcomeController < ApplicationController
  def index
    @results = search
  end

  private

    def search_params
      params.permit(:song, :album, :artist)
    end

    def search
      # byebug
      if !search_params[:song].empty?
        search_song
      elsif !search_params[:album].empty?
        search_album
      elsif !search_params[:artist].empty?
        search_artist
      end
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
