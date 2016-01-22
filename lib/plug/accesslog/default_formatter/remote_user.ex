defmodule Plug.AccessLog.DefaultFormatter.RemoteUser do
  @moduledoc """
  Determines remote user.
  """

  import Plug.Conn

  @doc """
  Appends to log output.
  """
  @spec append(String.t, Plug.Conn.t) :: String.t
  def append(message, conn), do: message <> remote_user(conn)

  defp remote_user(conn) do
    try do
      if a = conn.private.plug_session["repo_userid"] do
        "#{a}"
      else
        "-"
      end
    rescue
      _ -> "-"
    end
  end

end
