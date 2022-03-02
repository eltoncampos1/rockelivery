defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{
        "age" => 20,
        "address" => "fake address, 0",
        "cep" => "12345678",
        "cpf" => "12345678910",
        "email" => "fake@email.com",
        "name" => "fake user",
        "password" => "123456"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "fake address, 0",
                 "age" => 20,
                 "cep" => "12345678",
                 "cpf" => "12345678910",
                 "email" => "fake@email.com",
                 "id" => _id,
                 "name" => "fake user"
               }
             } = response
    end

    test "when there is some error, returns error", %{conn: conn} do
      params = %{
        "name" => "fake user",
        "password" => "123456"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "63491ee7-f059-4490-9c2d-2f62de3eae2b"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
