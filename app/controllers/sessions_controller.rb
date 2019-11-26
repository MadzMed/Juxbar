class SessionsController < ApplicationController
  def index
    @sessions = Session.all
    @sessions.each do |session|
      session.bar.geocode
    end

    @markers = @sessions.map do |session|
      {
        lat: session.bar.latitude,
        lng: session.bar.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { session: session })
      }
    end
  end

  def show
    @session = Session.find(params[:id])
  end
end
