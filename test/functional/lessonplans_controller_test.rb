require 'test_helper'

class LessonplansControllerTest < ActionController::TestCase
  setup do
    @lessonplan = lessonplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lessonplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lessonplan" do
    assert_difference('Lessonplan.count') do
      post :create, lessonplan: { campus: @lessonplan.campus, lesson_plan: @lessonplan.lesson_plan, name: @lessonplan.name }
    end

    assert_redirected_to lessonplan_path(assigns(:lessonplan))
  end

  test "should show lessonplan" do
    get :show, id: @lessonplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lessonplan
    assert_response :success
  end

  test "should update lessonplan" do
    put :update, id: @lessonplan, lessonplan: { campus: @lessonplan.campus, lesson_plan: @lessonplan.lesson_plan, name: @lessonplan.name }
    assert_redirected_to lessonplan_path(assigns(:lessonplan))
  end

  test "should destroy lessonplan" do
    assert_difference('Lessonplan.count', -1) do
      delete :destroy, id: @lessonplan
    end

    assert_redirected_to lessonplans_path
  end
end
