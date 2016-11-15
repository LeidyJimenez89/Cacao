require 'test_helper'

class LaborsControllerTest < ActionController::TestCase
  setup do
    @labor = labors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create labor" do
    assert_difference('Labor.count') do
      post :create, labor: { code: @labor.code, name: @labor.name, paymentunit: @labor.paymentunit, rate: @labor.rate, user_id: @labor.user_id }
    end

    assert_redirected_to labor_path(assigns(:labor))
  end

  test "should show labor" do
    get :show, id: @labor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @labor
    assert_response :success
  end

  test "should update labor" do
    patch :update, id: @labor, labor: { code: @labor.code, name: @labor.name, paymentunit: @labor.paymentunit, rate: @labor.rate, user_id: @labor.user_id }
    assert_redirected_to labor_path(assigns(:labor))
  end

  test "should destroy labor" do
    assert_difference('Labor.count', -1) do
      delete :destroy, id: @labor
    end

    assert_redirected_to labors_path
  end
end
