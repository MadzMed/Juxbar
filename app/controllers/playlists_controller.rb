class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where(session_id: params[:session_id])
    # @playlists = Playlist.all
  end

  def update
    if Like.where(user_id: current_user.id, song_id: params[:song]).empty?
      @like = Like.new(user_id: current_user.id, song_id: params[:song], status: params[:like])
      if @like.save
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
    else
      @like = Like.where(user_id: current_user.id, song_id: params[:song])
      if @like.update(status: params[:like])
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
    end
  end
end
