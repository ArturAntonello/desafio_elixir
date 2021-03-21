defmodule DesafioElixirWeb.PessoaJuridicaView do
  use DesafioElixirWeb, :view
  alias DesafioElixirWeb.PessoaJuridicaView

  def render("index.json", %{pessoas_juridicas: pessoas_juridicas}) do
    %{data: render_many(pessoas_juridicas, PessoaJuridicaView, "pessoa_juridica.json")}
  end

  def render("show.json", %{pessoa_juridica: pessoa_juridica}) do
    %{data: render_one(pessoa_juridica, PessoaJuridicaView, "pessoa_juridica.json")}
  end

  def render("pessoa_juridica.json", %{pessoa_juridica: pessoa_juridica}) do
    %{id: pessoa_juridica.id,
      nome: pessoa_juridica.nome,
      cnpj: pessoa_juridica.cnpj,
      pais: pessoa_juridica.pais,
      unidade_fed: pessoa_juridica.unidade_fed,
      cidade: pessoa_juridica.cidade,
      rua: pessoa_juridica.rua,
      cep_zip: pessoa_juridica.cep_zip}
  end
end
