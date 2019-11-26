class my::PlaylistsController < ApplicationController
  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    @playlist.save
    redirect_to my_playlist_path
  end

  def update
  end

  private

  def playlist_params
    params.require(:playlist).permit(:started_at)
  end
end
