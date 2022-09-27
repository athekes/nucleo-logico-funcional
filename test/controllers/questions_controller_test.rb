require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url, as: :json
    assert_response :success
  end

  test "should create question" do
    assert_difference("Question.count") do
      post questions_url, params: { question: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show question" do
    get question_url(@question), as: :json
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: {  } }, as: :json
    assert_response :success
  end

  test "should destroy question" do
    assert_difference("Question.count", -1) do
      delete question_url(@question), as: :json
    end

    assert_response :no_content
  end
end
