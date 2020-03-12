require 'json'
require 'open-uri'

class My::PlaylistsController < ApplicationController
  def show
    @playlist = Playlist.find(params[:id])
    @playlists = @playlist.session.playlists
  end

  def new
    if current_user.playlists.find_by(session_id: params[:session_id])
      @playlist = current_user.playlists.find_by(session_id: params[:session_id])
    else
      @playlist = Playlist.create(session_id: params[:session_id], user_id: current_user.id, started_at: Time.now)
    end
    if params[:search].present?
      songs_serialized = open("https://api.deezer.com/search?q=#{params[:search][:query]}").read
      @songs = JSON.parse(songs_serialized)
    else
      songs_serialized = open("https://api.deezer.com/chart/?limit=20").read
      @songs = JSON.parse(songs_serialized)
    end
    if current_user.playlists.find_by(session_id: params[:session_id]).present?
      @mysongs = current_user.playlists.find_by(session_id: params[:session_id]).songs
    end
  end

  def create
    if user_signed_in? && current_user.playlists.present?
      if current_user.playlists.where(session_id: params[:session_id]).present?
        @playlist = current_user.playlists.find_by(session_id: params[:session_id])
        if (@playlist.songs.count < 5)
          @song = Song.new(songs_params)
          @song.playlist_id = @playlist.id
          @song.save
        end
      else
        @playlist = Playlist.new(session_id: params[:session_id], user_id: current_user, started_at: Time.now)
        if @playlist.save
          @song = Song.new(songs_params)
          @song.playlist_id = @playlist.id
          @song.save
        end
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

  def destroy
    @playlist = Playlist.find_by(session_id: params[:session_id], user_id: current_user.id)
    @songs = @playlist.songs
    @songs.each do |song|
      if song.artist == params[:song][:artist] && song.title == params[:song][:title]
        song.destroy
        redirect_to new_session_my_playlist_path(session_id: params[:session_id])
      end
    end

  end

  private

  def songs_params
    params.require(:song).permit(:artist, :album, :category, :duration, :title, :deezer_id, :composer, :photo_album, :photo_large, :photo_artist, :preview)
  end
end
