defmodule DulceWeb.GoogleAuthController do
  use DulceWeb, :controller

  def index(conn, %{"code" => code}) do
    {:ok, token} = ElixirAuthGoogle.get_token(code, DulceWeb.Endpoint.url())
    {:ok, profile} = ElixirAuthGoogle.get_user_profile(token.access_token)

    user_record =
      Dulce.Accounts.get_user_by_email_or_register(
        profile.email,
        profile.picture,
        profile.name
      )

    conn
    |> DulceWeb.UserAuth.log_in_user(user_record)
  end

  def index(conn, %{"error" => "access_denied"}) do
    conn
    |> redirect(to: ~p"/")
  end
end
