require 'test_helper'

class SituacaoPacientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @situacao_paciente = situacao_pacientes(:one)
  end

  test "should get index" do
    get situacao_pacientes_url
    assert_response :success
  end

  test "should get new" do
    get new_situacao_paciente_url
    assert_response :success
  end

  test "should create situacao_paciente" do
    assert_difference('SituacaoPaciente.count') do
      post situacao_pacientes_url, params: { situacao_paciente: { nome: @situacao_paciente.nome } }
    end

    assert_redirected_to situacao_paciente_url(SituacaoPaciente.last)
  end

  test "should show situacao_paciente" do
    get situacao_paciente_url(@situacao_paciente)
    assert_response :success
  end

  test "should get edit" do
    get edit_situacao_paciente_url(@situacao_paciente)
    assert_response :success
  end

  test "should update situacao_paciente" do
    patch situacao_paciente_url(@situacao_paciente), params: { situacao_paciente: { nome: @situacao_paciente.nome } }
    assert_redirected_to situacao_paciente_url(@situacao_paciente)
  end

  test "should destroy situacao_paciente" do
    assert_difference('SituacaoPaciente.count', -1) do
      delete situacao_paciente_url(@situacao_paciente)
    end

    assert_redirected_to situacao_pacientes_url
  end
end
