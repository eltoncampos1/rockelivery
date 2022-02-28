defmodule Rockelivery.Users.Delete do
  alias Ecto.UUID
  alias Rockelivery.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> delete(uuid)
    end
  end

  def delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user_error()}
      user -> Repo.delete(user)
    end
  end
end
