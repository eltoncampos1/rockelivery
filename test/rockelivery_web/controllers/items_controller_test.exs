defmodule RockeliveryWeb.ItemsControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, create an item", %{conn: conn} do
      params = %{
        "category" => "food",
        "description" => "sucão delicia",
        "price" => "12.00",
        "photo" => "/priv/photos/banana.jpg"
      }

      response =
        conn
        |> post(Routes.items_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Item created!",
               "item" => %{
                 "category" => "food",
                 "description" => "sucão delicia",
                 "id" => _id,
                 "photo" => "/priv/photos/banana.jpg",
                 "price" => "12.00"
               }
             } = response
    end
  end
end
