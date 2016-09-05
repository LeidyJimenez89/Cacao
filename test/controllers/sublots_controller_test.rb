require 'test_helper'

class SublotsControllerTest < ActionController::TestCase
  setup do
    @sublot = sublots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sublots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sublot" do
    assert_difference('Sublot.count') do
      post :create, sublot: { code: @sublot.code, description: @sublot.description, name: @sublot.name, user_id: @sublot.user_id }
    end

    assert_redirected_to sublot_path(assigns(:sublot))
  end

  test "should show sublot" do
    get :show, id: @sublot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sublot
    assert_response :success
  end

  test "should update sublot" do
    patch :update, id: @sublot, sublot: { code: @sublot.code, description: @sublot.description, name: @sublot.name, user_id: @sublot.user_id }
    assert_redirected_to sublot_path(assigns(:sublot))
  end

  test "should destroy sublot" do
    assert_difference('Sublot.count', -1) do
      delete :destroy, id: @sublot
    end

    assert_redirected_to sublots_path
  end
end
