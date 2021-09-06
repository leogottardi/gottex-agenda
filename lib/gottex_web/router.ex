defmodule GottexWeb.Router do
  use GottexWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug GottexWeb.Auth.Pipeline
  end

  scope "/api", GottexWeb do
    pipe_through [:api]
    post "/users", UsersController, :create
    post "/login", AuthController, :login
  end

  scope "/api", GottexWeb do
    pipe_through [:api, :auth]
    get "/users/:id", UsersController, :show
  end


  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: GottexWeb.Telemetry
    end
  end
end
