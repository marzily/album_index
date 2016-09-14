class WelcomeController < ApplicationController
  def index
    @results = search_artist
  end

  private

    def search_params
      params.permit(:song, :album, :artist)
    end

    def search_song
      Song.search(search_params[:song])
    end

    def search_artist
      Artist.search(search_params[:artist])
    end
end


  # def filter
  #   artists = nil
  #   if search_params[:artist]
  #     artists = Artist.search(search_params[:artist])
  #   end
  #
  #   artists = nil
  #   if search_params[:album] && artists
  #     artists.each do |artist|
  #       albums = artist.albums.where(title: search_params[:album])
  #     end
  #   elsif search_params[:album]
  #     albums = Album.search(search_params[:album])
  #   end
  #
  #   songs = nil
  #   if search_params[:song] && artists && albums
  #     albums.each do |album|
  #       songs = album.songs.where(title: search_params[:song])
  #     end
  #   elsif search_params[:song] && artists
  #     artists.each do |artist|
  #       songs = artist.songs.where(title: search_params[:song])
  #     end
  #   elsif search_params[:song] && albums
  #     albums.each do |album|
  #       songs = album.songs.where(title: search_params[:song])
  #     end
  #   elsif search_params[:songs]
  #     songs = Song.search(search_params[:songs])
  #   end
