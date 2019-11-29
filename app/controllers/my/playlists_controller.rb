require 'json'
require 'open-uri'

class My::PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
    @playlists = @playlist.session.playlists
  end

  def new
    @playlist = Playlist.new(session_id: params[:session_id])
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
      redirect_to my_playlist_path
    else
      render :new
    end
  end

  def update
    @playlist = Playlist.find(params[:id])
  end

  private

  def playlist_params
    params.require(:playlist).permit(:started_at)
  end
end
