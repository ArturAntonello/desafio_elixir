defmodule DesafioElixir.Repo.Migrations.CreateContratoRelPessoaJuridica do
  use Ecto.Migration

  def change do
    create table(:contrato_rel_pessoa_juridica) do
      add :pessoa_juridica_id, references(:pessoas_juridicas, on_delete: :nothing), null: false
      add :contratos_id, references(:contratos, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:contrato_rel_pessoa_juridica, [:pessoa_juridica_id])
    create index(:contrato_rel_pessoa_juridica, [:contratos_id])
  end
end
