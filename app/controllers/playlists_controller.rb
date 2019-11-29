class PlaylistsController < ApplicationController
  def index
    # @playlists = Playlist.where(session_id: params[:session_id])
    @playlists = Playlist.all
  end

  def update
    raise
    @playlist = Playlist.find(params[:id])
    @song.new(song_params)
    @song.playlist_id = @playlist.id
    render :index
  end

  private

  def song_params
    params.require(:playlist).permit(:artist, :album, :category, :duration, :title, :deezer_id, :composer)
  end
end
