class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where(session_id: params[:session_id])
    # @playlists = Playlist.all
  end

  def update
    @like = Like.new(user_id: 1)
    @song = Song.find(params[:song])
    @like.song_id = @song.id
    raise
    @playlist = Playlist.find(params[:id])
    @song.new(song_params)
    @song.playlist_id = @playlist.id
    if @song.save
      respond_to do |format|
        format.html { redirect_to my_playlist_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'my/playlists/new' }
        format.js
      end
    end
    render :index
  end

  private

  def song_params
    params.require(:playlist).permit(:artist, :album, :category, :duration, :title, :deezer_id, :composer)
  end
end
