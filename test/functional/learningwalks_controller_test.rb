require 'test_helper'

class LearningwalksControllerTest < ActionController::TestCase
  setup do
    @learningwalk = learningwalks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learningwalks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learningwalk" do
    assert_difference('Learningwalk.count') do
      post :create, learningwalk: { growths: @learningwalk.growths, highlights: @learningwalk.highlights, observer: @learningwalk.observer, subject: @learningwalk.subject }
    end

    assert_redirected_to learningwalk_path(assigns(:learningwalk))
  end

  test "should show learningwalk" do
    get :show, id: @learningwalk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learningwalk
    assert_response :success
  end

  test "should update learningwalk" do
    put :update, id: @learningwalk, learningwalk: { growths: @learningwalk.growths, highlights: @learningwalk.highlights, observer: @learningwalk.observer, subject: @learningwalk.subject }
    assert_redirected_to learningwalk_path(assigns(:learningwalk))
  end

  test "should destroy learningwalk" do
    assert_difference('Learningwalk.count', -1) do
      delete :destroy, id: @learningwalk
    end

    assert_redirected_to learningwalks_path
  end
end
