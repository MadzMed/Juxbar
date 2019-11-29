require 'json'
require 'open-uri'

class My::PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
    @playlists = @playlist.session.playlists.where(user_id: 1)
  end

  def new
    @playlist = Playlist.new(session_id: params[:session_id], user_id: 1, started_at: Time.now)
    # @song = Song.new(playlist_id: @playlist.id)
    if params[:search].present?
      songs_serialized = open("https://api.deezer.com/search?q=#{params[:search][:query]}").read
      @songs = JSON.parse(songs_serialized)
    else
      songs_serialized = open("https://api.deezer.com/chart/?limit=20").read
      @songs = JSON.parse(songs_serialized)
    end
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
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

  def update
    raise
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:started_at)
  end
end
