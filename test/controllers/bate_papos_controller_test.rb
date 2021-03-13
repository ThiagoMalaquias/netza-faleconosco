require 'test_helper'

class BatePaposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bate_papo = bate_papos(:one)
  end

  test "should get index" do
    get bate_papos_url
    assert_response :success
  end

  test "should get new" do
    get new_bate_papo_url
    assert_response :success
  end

  test "should create bate_papo" do
    assert_difference('BatePapo.count') do
      post bate_papos_url, params: { bate_papo: { mensagem: @bate_papo.mensagem, usuario_id: @bate_papo.usuario_id } }
    end

    assert_redirected_to bate_papo_url(BatePapo.last)
  end

  test "should show bate_papo" do
    get bate_papo_url(@bate_papo)
    assert_response :success
  end

  test "should get edit" do
    get edit_bate_papo_url(@bate_papo)
    assert_response :success
  end

  test "should update bate_papo" do
    patch bate_papo_url(@bate_papo), params: { bate_papo: { mensagem: @bate_papo.mensagem, usuario_id: @bate_papo.usuario_id } }
    assert_redirected_to bate_papo_url(@bate_papo)
  end

  test "should destroy bate_papo" do
    assert_difference('BatePapo.count', -1) do
      delete bate_papo_url(@bate_papo)
    end

    assert_redirected_to bate_papos_url
  end
end
