class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where(session_id: params[:session_id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    render :index
  end

  private

  def playlist_params
    params.require(:playlist).permit(:song_id)
  end

end
