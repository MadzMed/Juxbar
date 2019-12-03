require 'json'
require 'open-uri'

class My::PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
    @playlists = @playlist.session.playlists
  end

  def new
    @playlist = Playlist.create(session_id: params[:session_id], user_id: 1, started_at: Time.now)
    if params[:search].present?
      songs_serialized = open("https://api.deezer.com/search?q=#{params[:search][:query]}").read
      @songs = JSON.parse(songs_serialized)
    else
      songs_serialized = open("https://api.deezer.com/chart/?limit=20").read
      @songs = JSON.parse(songs_serialized)
    end
  end

  def create
    if user_signed_in? && current_user.playlists.present?
      if current_user.playlists.where(session_id: params[:session_id]).present?
        @playlist = current_user.playlists.find_by(session_id: params[:session_id])
        @song = Song.new(songs_params)
        @song.playlist_id = @playlist.id
        @song.save
      else
        @playlist = Playlist.new(started_at: Time.now)
        @playlist.user_id = current_user
        @playlist.session_id = params[:session_id]
        if @playlist.save
          @song = Song.new(songs_params)
          @song.playlist_id = @playlist.id
          @song.save
          raise
        end
      end
    else
      @playlist = Playlist.find(params[:playlist_id])
      @playlist.user_id =
      @playlist.session_id = params[:session_id]
      if @playlist.save
        @song = Song.new(songs_params)
        @song.playlist_id = @playlist.id
        @song.save
      end
    end
    if @playlist.save
      respond_to do |format|
        format.html { redirect_to my_playlist_path(params[:session_id]) }
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

  def songs_params
    params.require(:song).permit(:artist, :album, :category, :duration, :title, :deezer_id, :composer, :photo_album, :photo_large, :photo_artist)
  end
end
