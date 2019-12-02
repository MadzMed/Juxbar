class SessionsController < ApplicationController
  def index
    if params[:search].present?
      sql_query = "\
        sessions.category ILIKE :query \
        OR bars.address ILIKE :query \
        OR bars.name ILIKE :query \
      "
      @sessions = Session.joins(:bar).where(sql_query, query: "%#{params[:search][:query]}%")
      @sessions.each do |session|
        session.bar.geocode
      end
    else
      @sessions = Session.all
      @sessions.each do |session|
        session.bar.geocode
      end
    end

    @markers = @sessions.map do |session|
      {
        lat: session.bar.latitude,
        lng: session.bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { session: session }),
        image_url: helpers.asset_url('https://www.google.fr/imgres?imgurl=https%3A%2F%2Fshannon-pub.fr%2Fwp-content%2Fuploads%2F2018%2F04%2FShannon-17.jpg&imgrefurl=https%3A%2F%2Fshannon-pub.fr%2F&docid=ayLTPYvKrwud3M&tbnid=R2PoFeODeo83eM%3A&vet=10ahUKEwjy54jVo4jmAhUQzhoKHQJYBHAQMwhgKBUwFQ..i&w=1000&h=667&bih=814&biw=1440&q=photo%20bar%20dansant&ved=0ahUKEwjy54jVo4jmAhUQzhoKHQJYBHAQMwhgKBUwFQ&iact=mrc&uact=8')      }
    end
  end

  def show
    @session = Session.find(params[:id])
  end
end

# session.bar.address
# session.bar.name
# session.category
