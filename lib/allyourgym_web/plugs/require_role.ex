defmodule AllyourgymWeb.Plugs.RequireRole do
  import Plug.Conn
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, role) do
    user = conn.assigns[:current_user]

    if user && user.role == role do
      conn
    else
      conn
      |> put_flash(:error, "You are not authorized to access this page.")
      |> redirect(to: "/")
      |> halt()
    end
  end
end
