defmodule GottexWeb.FallbackController do
  use GottexWeb, :controller

  alias GottexWeb.ErrorView

  def call(conn, {:error, error}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", result: error)
  end

  def call(conn, error) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", result: error)
  end
end
