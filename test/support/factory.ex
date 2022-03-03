defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.{Item, User}

  def user_params_factory do
    %{
      age: 20,
      address: "fake address, 0",
      cep: "12345678",
      cpf: "12345678910",
      email: "fake@email.com",
      name: "fake user",
      password: "123456"
    }
  end

  def user_factory do
    %User{
      age: 20,
      address: "fake address, 0",
      cep: "12345678",
      cpf: "12345678910",
      email: "fake@email.com",
      name: "fake user",
      password: "123456",
      id: "63491ee7-f059-4490-9c2d-2f62de3eae2b"
    }
  end

  def item_factory do
    %Item{
      category: "food",
      description: "sucão delicia",
      price: "12.00",
      photo: "/priv/photos/banana.jpg",
      id: "38ecf66d-31cf-4369-b6e1-f68c49500e2e"
    }
  end
end
