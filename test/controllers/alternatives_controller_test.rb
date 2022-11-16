require "test_helper"

class AlternativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alternative = alternatives(:one)
  end

  test "should get index" do
    get alternatives_url, as: :json
    assert_response :success
  end

  test "should create alternative" do
    assert_difference("Alternative.count") do
      post alternatives_url, params: { alternative: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show alternative" do
    get alternative_url(@alternative), as: :json
    assert_response :success
  end

  test "should update alternative" do
    patch alternative_url(@alternative), params: { alternative: {  } }, as: :json
    assert_response :success
  end

  test "should destroy alternative" do
    assert_difference("Alternative.count", -1) do
      delete alternative_url(@alternative), as: :json
    end

    assert_response :no_content
  end
end
