defmodule AllyourgymWeb.PageController do
  use AllyourgymWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
    # render(conn, :home, layout: {AllyourgymWeb.Layouts, :app})
  end
end
