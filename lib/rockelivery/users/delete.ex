defmodule Rockelivery.Users.Delete do
  alias Rockelivery.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user_error()}
      user -> Repo.delete(user)
    end
  end
end
