require 'json'
require 'open-uri'

class My::PlaylistsController < ApplicationController
  def show
  end

  def new
    @playlist = Playlist.new
    songs_serialized = open("https://api.deezer.com/chart/?limit=5").read
    @songs = JSON.parse(songs_serialized)

  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
      redirect_to my_playlist_path
    else
      render :new
    end
  end

  def update
  end

  private

  def playlist_params
    params.require(:playlist).permit(:started_at)
  end
end
