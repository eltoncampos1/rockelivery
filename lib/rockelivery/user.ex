defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:age, :address, :cep, :cpf, :email, :password, :name]
  @update_params @required_params -- [:password]

  @derive {Jason.Encoder, only: [:age, :address, :cep, :cpf, :email, :name, :id]}

  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    has_many :orders, Order

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @update_params)
    |> validate_required(@update_params)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
