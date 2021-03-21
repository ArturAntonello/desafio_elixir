defmodule DesafioElixir.PessoasJuridicasTest do
  use DesafioElixir.DataCase

  alias DesafioElixir.PessoasJuridicas

  describe "pessoas_juridicas" do
    alias DesafioElixir.PessoasJuridicas.PessoaJuridica

    @valid_attrs %{cnpj: "some cnpj", end_comp: "some end_comp", nome: "some nome"}
    @update_attrs %{cnpj: "some updated cnpj", end_comp: "some updated end_comp", nome: "some updated nome"}
    @invalid_attrs %{cnpj: nil, end_comp: nil, nome: nil}

    def pessoa_juridica_fixture(attrs \\ %{}) do
      {:ok, pessoa_juridica} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PessoasJuridicas.create_pessoa_juridica()

      pessoa_juridica
    end

    test "list_pessoas_juridicas/0 returns all pessoas_juridicas" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert PessoasJuridicas.list_pessoas_juridicas() == [pessoa_juridica]
    end

    test "get_pessoa_juridica!/1 returns the pessoa_juridica with given id" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert PessoasJuridicas.get_pessoa_juridica!(pessoa_juridica.id) == pessoa_juridica
    end

    test "create_pessoa_juridica/1 with valid data creates a pessoa_juridica" do
      assert {:ok, %PessoaJuridica{} = pessoa_juridica} = PessoasJuridicas.create_pessoa_juridica(@valid_attrs)
      assert pessoa_juridica.cnpj == "some cnpj"
      assert pessoa_juridica.end_comp == "some end_comp"
      assert pessoa_juridica.nome == "some nome"
    end

    test "create_pessoa_juridica/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PessoasJuridicas.create_pessoa_juridica(@invalid_attrs)
    end

    test "update_pessoa_juridica/2 with valid data updates the pessoa_juridica" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert {:ok, %PessoaJuridica{} = pessoa_juridica} = PessoasJuridicas.update_pessoa_juridica(pessoa_juridica, @update_attrs)
      assert pessoa_juridica.cnpj == "some updated cnpj"
      assert pessoa_juridica.end_comp == "some updated end_comp"
      assert pessoa_juridica.nome == "some updated nome"
    end

    test "update_pessoa_juridica/2 with invalid data returns error changeset" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert {:error, %Ecto.Changeset{}} = PessoasJuridicas.update_pessoa_juridica(pessoa_juridica, @invalid_attrs)
      assert pessoa_juridica == PessoasJuridicas.get_pessoa_juridica!(pessoa_juridica.id)
    end

    test "delete_pessoa_juridica/1 deletes the pessoa_juridica" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert {:ok, %PessoaJuridica{}} = PessoasJuridicas.delete_pessoa_juridica(pessoa_juridica)
      assert_raise Ecto.NoResultsError, fn -> PessoasJuridicas.get_pessoa_juridica!(pessoa_juridica.id) end
    end

    test "change_pessoa_juridica/1 returns a pessoa_juridica changeset" do
      pessoa_juridica = pessoa_juridica_fixture()
      assert %Ecto.Changeset{} = PessoasJuridicas.change_pessoa_juridica(pessoa_juridica)
    end
  end
end
