defmodule DesafioElixir.PessoasFisicas.PessoaFisica do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesafioElixir.Contratos.Rel_PF

  schema "pessoas_fisicas" do
    field :cpf, :string
    field :data_nasc, :string
    field :nome, :string

    belongs_to :contrato_rel_pessoa_fisica, Rel_PF

    timestamps()
  end

  @required_fields [:nome, :cpf, :data_nasc]
  @optional_fields ~w()

  @doc false
  def changeset(pessoa_fisica, attrs) do
    pessoa_fisica
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
