defmodule Rockelivery.ItemTest do
  use Rockelivery.DataCase

  alias Rockelivery.Item
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all params are correct, receive a valid changeset" do
      params = %{
        category: "food",
        description: "sucão delicia",
        price: "12.00",
        photo: "/priv/photos/banana.jpg"
      }

      response = Item.changeset(params)

      assert %Changeset{changes: %{description: "sucão delicia"}, valid?: true} = response
    end
  end

  test "when there are some error, returns an invalid changeset" do
    params = %{
      category: "food",
      description: "sucão delicia",
      price: "-1",
      photo: "/priv/photos/banana.jpg"
    }

    response = Item.changeset(params)

    expected_response = %{price: ["must be greater than 0"]}

    assert errors_on(response) == expected_response
  end
end
