defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "fake address, 0",
               age: 20,
               cep: "12345678",
               cpf: "12345678910",
               email: "fake@email.com",
               id: "63491ee7-f059-4490-9c2d-2f62de3eae2b",
               inserted_at: nil,
               name: "fake user",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
