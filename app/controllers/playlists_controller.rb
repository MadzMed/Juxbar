class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:song_id)
  end
end
