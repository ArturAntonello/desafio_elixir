defmodule DesafioElixirWeb.PessoaJuridicaController do
  use DesafioElixirWeb, :controller

  alias DesafioElixir.PessoasJuridicas
  alias DesafioElixir.PessoasJuridicas.PessoaJuridica

  action_fallback DesafioElixirWeb.FallbackController

  def index(conn, _params) do
    pessoas_juridicas = PessoasJuridicas.list_pessoas_juridicas()
    render(conn, "index.json", pessoas_juridicas: pessoas_juridicas)
  end

  def create(conn, %{"pessoa_juridica" => pessoa_juridica_params}) do
    with {:ok, %PessoaJuridica{} = pessoa_juridica} <- PessoasJuridicas.create_pessoa_juridica(pessoa_juridica_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pessoa_juridica_path(conn, :show, pessoa_juridica))
      |> render("show.json", pessoa_juridica: pessoa_juridica)
    end
  end

  def show(conn, %{"id" => id}) do
    pessoa_juridica = PessoasJuridicas.get_pessoa_juridica!(id)
    render(conn, "show.json", pessoa_juridica: pessoa_juridica)
  end

  def update(conn, %{"id" => id, "pessoa_juridica" => pessoa_juridica_params}) do
    pessoa_juridica = PessoasJuridicas.get_pessoa_juridica!(id)

    with {:ok, %PessoaJuridica{} = pessoa_juridica} <- PessoasJuridicas.update_pessoa_juridica(pessoa_juridica, pessoa_juridica_params) do
      render(conn, "show.json", pessoa_juridica: pessoa_juridica)
    end
  end

  def delete(conn, %{"id" => id}) do
    pessoa_juridica = PessoasJuridicas.get_pessoa_juridica!(id)

    with {:ok, %PessoaJuridica{}} <- PessoasJuridicas.delete_pessoa_juridica(pessoa_juridica) do
      send_resp(conn, :no_content, "")
    end
  end
end
