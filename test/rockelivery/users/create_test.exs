defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true
  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, name: "fake user", email: "fake@email.com"}} = response
    end

    test "hwen there are invalid params, returns an error" do
      params = build(:user_params, %{password: "123", age: 14})

      response = Create.call(params)

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
