defmodule GottexWeb.Router do
  use GottexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GottexWeb do
    pipe_through :api

    post "/users", UsersController, :create
  end



  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: GottexWeb.Telemetry
    end
  end
end
