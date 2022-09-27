require "test_helper"

class QuestionairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questionaire = questionaires(:one)
  end

  test "should get index" do
    get questionaires_url, as: :json
    assert_response :success
  end

  test "should create questionaire" do
    assert_difference("Questionaire.count") do
      post questionaires_url, params: { questionaire: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show questionaire" do
    get questionaire_url(@questionaire), as: :json
    assert_response :success
  end

  test "should update questionaire" do
    patch questionaire_url(@questionaire), params: { questionaire: {  } }, as: :json
    assert_response :success
  end

  test "should destroy questionaire" do
    assert_difference("Questionaire.count", -1) do
      delete questionaire_url(@questionaire), as: :json
    end

    assert_response :no_content
  end
end
