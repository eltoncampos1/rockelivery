defmodule Rockelivery.Factory do
  use ExMachina

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
end
