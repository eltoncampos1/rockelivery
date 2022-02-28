defmodule Rockelivery.Error do
  @keys [:status, :result]
  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_user_error, do: build(:not_found, "User not found!.")
  def build_id_format_error, do: build(:bad_request, "Invalid id format!.")
end
