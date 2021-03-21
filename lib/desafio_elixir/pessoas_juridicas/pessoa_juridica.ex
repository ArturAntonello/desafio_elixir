defmodule DesafioElixir.PessoasJuridicas.PessoaJuridica do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesafioElixir.Contratos.Rel_PJ

  schema "pessoas_juridicas" do
    field :cnpj, :string
    field :pais, :string
    field :unidade_fed, :string
    field :cidade, :string
    field :rua, :string
    field :cep_zip, :string
    field :nome, :string

    belongs_to :contrato_rel_pessoa_juridica, Rel_PJ

    timestamps()
  end

  @required_fields [:nome, :pais, :unidade_fed, :cidade, :rua, :cep_zip, :cnpj]
  @optional_fields ~w()

  @doc false
  def changeset(pessoa_juridica, attrs) do
    pessoa_juridica
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
