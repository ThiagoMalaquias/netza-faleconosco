require 'test_helper'

class AnalistasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analista = analistas(:one)
  end

  test "should get index" do
    get analistas_url
    assert_response :success
  end

  test "should get new" do
    get new_analista_url
    assert_response :success
  end

  test "should create analista" do
    assert_difference('Analista.count') do
      post analistas_url, params: { analista: { cargo: @analista.cargo, nome: @analista.nome, telefone: @analista.telefone } }
    end

    assert_redirected_to analista_url(Analista.last)
  end

  test "should show analista" do
    get analista_url(@analista)
    assert_response :success
  end

  test "should get edit" do
    get edit_analista_url(@analista)
    assert_response :success
  end

  test "should update analista" do
    patch analista_url(@analista), params: { analista: { cargo: @analista.cargo, nome: @analista.nome, telefone: @analista.telefone } }
    assert_redirected_to analista_url(@analista)
  end

  test "should destroy analista" do
    assert_difference('Analista.count', -1) do
      delete analista_url(@analista)
    end

    assert_redirected_to analistas_url
  end
end
