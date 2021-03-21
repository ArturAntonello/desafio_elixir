defmodule DesafioElixirWeb.ContratoView do
  use DesafioElixirWeb, :view
  alias DesafioElixirWeb.ContratoView

  def render("index.json", %{contratos: contratos}) do
    %{data: render_many(contratos, ContratoView, "contrato.json")}
  end

  def render("show.json", %{contrato: contrato}) do
    %{data: render_one(contrato, ContratoView, "contrato.json")}
  end

  def render("contrato.json", %{contrato: contrato}) do
    %{id: contrato.id,
      nome: contrato.nome,
      descricao: contrato.descricao,
      data: contrato.data,
      pdf: contrato.pdf}
  end
end
