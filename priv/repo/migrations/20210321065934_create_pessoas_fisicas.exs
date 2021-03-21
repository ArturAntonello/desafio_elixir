defmodule DesafioElixir.Repo.Migrations.CreatePessoasFisicas do
  use Ecto.Migration

  def change do
    create table(:pessoas_fisicas) do
      add :nome, :string, null: false
      add :cpf, :string, null: false
      add :data_nasc, :string, null: false

      timestamps()
    end

  end
end
