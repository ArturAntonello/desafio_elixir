defmodule DesafioElixirWeb.PessoaFisicaController do
  use DesafioElixirWeb, :controller

  alias DesafioElixir.PessoasFisicas
  alias DesafioElixir.PessoasFisicas.PessoaFisica

  action_fallback DesafioElixirWeb.FallbackController

  def index(conn, _params) do
    pessoas_fisicas = PessoasFisicas.list_pessoas_fisicas()
    render(conn, "index.json", pessoas_fisicas: pessoas_fisicas)
  end

  def create(conn, %{"pessoa_fisica" => pessoa_fisica_params}) do
    with {:ok, %PessoaFisica{} = pessoa_fisica} <- PessoasFisicas.create_pessoa_fisica(pessoa_fisica_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pessoa_fisica_path(conn, :show, pessoa_fisica))
      |> render("show.json", pessoa_fisica: pessoa_fisica)
    end
  end

  def show(conn, %{"id" => id}) do
    pessoa_fisica = PessoasFisicas.get_pessoa_fisica!(id)
    render(conn, "show.json", pessoa_fisica: pessoa_fisica)
  end

  def update(conn, %{"id" => id, "pessoa_fisica" => pessoa_fisica_params}) do
    pessoa_fisica = PessoasFisicas.get_pessoa_fisica!(id)

    with {:ok, %PessoaFisica{} = pessoa_fisica} <- PessoasFisicas.update_pessoa_fisica(pessoa_fisica, pessoa_fisica_params) do
      render(conn, "show.json", pessoa_fisica: pessoa_fisica)
    end
  end

  def delete(conn, %{"id" => id}) do
    pessoa_fisica = PessoasFisicas.get_pessoa_fisica!(id)

    with {:ok, %PessoaFisica{}} <- PessoasFisicas.delete_pessoa_fisica(pessoa_fisica) do
      send_resp(conn, :no_content, "")
    end
  end
end
