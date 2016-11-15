require 'test_helper'

class CostcsControllerTest < ActionController::TestCase
  setup do
    @costc = costcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costc" do
    assert_difference('Costc.count') do
      post :create, costc: { code: @costc.code, description: @costc.description, name: @costc.name, user_id: @costc.user_id }
    end

    assert_redirected_to costc_path(assigns(:costc))
  end

  test "should show costc" do
    get :show, id: @costc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costc
    assert_response :success
  end

  test "should update costc" do
    patch :update, id: @costc, costc: { code: @costc.code, description: @costc.description, name: @costc.name, user_id: @costc.user_id }
    assert_redirected_to costc_path(assigns(:costc))
  end

  test "should destroy costc" do
    assert_difference('Costc.count', -1) do
      delete :destroy, id: @costc
    end

    assert_redirected_to costcs_path
  end
end
