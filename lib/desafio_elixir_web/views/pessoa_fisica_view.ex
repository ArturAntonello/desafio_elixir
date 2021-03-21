defmodule DesafioElixirWeb.PessoaFisicaView do
  use DesafioElixirWeb, :view
  alias DesafioElixirWeb.PessoaFisicaView

  def render("index.json", %{pessoas_fisicas: pessoas_fisicas}) do
    %{data: render_many(pessoas_fisicas, PessoaFisicaView, "pessoa_fisica.json")}
  end

  def render("show.json", %{pessoa_fisica: pessoa_fisica}) do
    %{data: render_one(pessoa_fisica, PessoaFisicaView, "pessoa_fisica.json")}
  end

  def render("pessoa_fisica.json", %{pessoa_fisica: pessoa_fisica}) do
    %{id: pessoa_fisica.id,
      nome: pessoa_fisica.nome,
      cpf: pessoa_fisica.cpf,
      data_nasc: pessoa_fisica.data_nasc}
  end
end
