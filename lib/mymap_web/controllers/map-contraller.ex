defmodule MymapWeb.MapController do
  use MymapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
