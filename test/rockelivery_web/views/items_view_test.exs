defmodule RockeliveryWeb.ItemsViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View

  import Rockelivery.Factory

  alias RockeliveryWeb.ItemsView

  test "renders create.json" do
    item = build(:item)

    response = render(ItemsView, "create.json", item: item)

    assert %{
             item: %Rockelivery.Item{
               category: "food",
               description: "sucão delicia",
               id: "38ecf66d-31cf-4369-b6e1-f68c49500e2e",
               photo: "/priv/photos/banana.jpg",
               price: "12.00",
               inserted_at: nil,
               updated_at: nil
             },
             message: "Item created!"
           } == response
  end
end
