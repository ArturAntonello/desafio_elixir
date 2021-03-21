defmodule DesafioElixir.Repo.Migrations.CreatePessoasJuridicas do
  use Ecto.Migration

  def change do
    create table(:pessoas_juridicas) do
      add :nome, :string, null: false
      add :cnpj, :string, null: false
      add :pais, :string, null: false
      add :unidade_fed, :string, null: false
      add :cidade, :string, null: false
      add :rua, :string, null: false
      add :cep_zip, :string, null: false

      timestamps()
    end

  end
end
