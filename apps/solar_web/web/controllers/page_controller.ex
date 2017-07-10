defmodule SolarWeb.PageController do
  use SolarWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
