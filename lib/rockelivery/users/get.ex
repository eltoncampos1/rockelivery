defmodule Rockelivery.Users.Get do
  alias Rockelivery.{Error, Repo, User}
  alias Ecto.UUID

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user_error()}
      user -> {:ok, user}
    end
  end
end
