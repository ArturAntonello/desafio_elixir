defmodule DesafioElixirWeb.ContratoControllerTest do
  use DesafioElixirWeb.ConnCase

  alias DesafioElixir.Contratos
  alias DesafioElixir.Contratos.Contrato

  @create_attrs %{
    data: "some data",
    descricao: "some descricao",
    nome: "some nome",
    pdf: "some pdf"
  }
  @update_attrs %{
    data: "some updated data",
    descricao: "some updated descricao",
    nome: "some updated nome",
    pdf: "some updated pdf"
  }
  @invalid_attrs %{data: nil, descricao: nil, nome: nil, pdf: nil}

  def fixture(:contrato) do
    {:ok, contrato} = Contratos.create_contrato(@create_attrs)
    contrato
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contratos", %{conn: conn} do
      conn = get(conn, Routes.contrato_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create contrato" do
    test "renders contrato when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contrato_path(conn, :create), contrato: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.contrato_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => "some data",
               "descricao" => "some descricao",
               "nome" => "some nome",
               "pdf" => "some pdf"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contrato_path(conn, :create), contrato: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update contrato" do
    setup [:create_contrato]

    test "renders contrato when data is valid", %{conn: conn, contrato: %Contrato{id: id} = contrato} do
      conn = put(conn, Routes.contrato_path(conn, :update, contrato), contrato: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.contrato_path(conn, :show, id))

      assert %{
               "id" => id,
               "data" => "some updated data",
               "descricao" => "some updated descricao",
               "nome" => "some updated nome",
               "pdf" => "some updated pdf"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, contrato: contrato} do
      conn = put(conn, Routes.contrato_path(conn, :update, contrato), contrato: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete contrato" do
    setup [:create_contrato]

    test "deletes chosen contrato", %{conn: conn, contrato: contrato} do
      conn = delete(conn, Routes.contrato_path(conn, :delete, contrato))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.contrato_path(conn, :show, contrato))
      end
    end
  end

  defp create_contrato(_) do
    contrato = fixture(:contrato)
    %{contrato: contrato}
  end
end
