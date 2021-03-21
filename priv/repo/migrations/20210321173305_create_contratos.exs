defmodule DesafioElixir.Repo.Migrations.CreateContratos do
  use Ecto.Migration

  def change do
    create table(:contratos) do
      add :nome, :string, null: false
      add :descricao, :string
      add :data, :string, null: false
      add :pdf, :string, null: false

      timestamps()
    end

  end
end
