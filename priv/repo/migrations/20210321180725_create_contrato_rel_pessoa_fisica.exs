defmodule DesafioElixir.Repo.Migrations.CreateContratoRelPessoaFisica do
  use Ecto.Migration

  def change do
    create table(:contrato_rel_pessoa_fisica) do
      add :pessoa_fisica_id, references(:pessoas_fisicas, on_delete: :nothing), null: false
      add :contratos_id, references(:contratos, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:contrato_rel_pessoa_fisica, [:pessoa_fisica_id])
    create index(:contrato_rel_pessoa_fisica, [:contratos_id])
  end
end
