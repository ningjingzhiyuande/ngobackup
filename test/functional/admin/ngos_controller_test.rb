require 'test_helper'

class Admin::NgosControllerTest < ActionController::TestCase
  setup do
    @admin_ngo = admin_ngos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_ngos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_ngo" do
    assert_difference('Admin::Ngo.count') do
      post :create, admin_ngo: { info: @admin_ngo.info, name: @admin_ngo.name, position: @admin_ngo.position }
    end

    assert_redirected_to admin_ngo_path(assigns(:admin_ngo))
  end

  test "should show admin_ngo" do
    get :show, id: @admin_ngo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_ngo
    assert_response :success
  end

  test "should update admin_ngo" do
    put :update, id: @admin_ngo, admin_ngo: { info: @admin_ngo.info, name: @admin_ngo.name, position: @admin_ngo.position }
    assert_redirected_to admin_ngo_path(assigns(:admin_ngo))
  end

  test "should destroy admin_ngo" do
    assert_difference('Admin::Ngo.count', -1) do
      delete :destroy, id: @admin_ngo
    end

    assert_redirected_to admin_ngos_path
  end
end
