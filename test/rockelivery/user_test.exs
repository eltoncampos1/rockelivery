defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase
  import Rockelivery.Factory

  alias Rockelivery.User
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are correct, receive a valid changeset" do
      params = build(:user_params)
      response = User.changeset(params)

      assert %Changeset{changes: %{name: "fake user"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      updated_params = %{
        name: "updated name"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(updated_params)

      assert %Changeset{changes: %{name: "updated name"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{age: 15, password: "123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
