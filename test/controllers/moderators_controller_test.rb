require 'test_helper'

class ModeratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moderator = moderators(:one)
  end

  test "should get index" do
    get moderators_url, as: :json
    assert_response :success
  end

  test "should create moderator" do
    assert_difference('Moderator.count') do
      post moderators_url, params: { moderator: { name: @moderator.name, password_digest: @moderator.password_digest, username: @moderator.username } }, as: :json
    end

    assert_response 201
  end

  test "should show moderator" do
    get moderator_url(@moderator), as: :json
    assert_response :success
  end

  test "should update moderator" do
    patch moderator_url(@moderator), params: { moderator: { name: @moderator.name, password_digest: @moderator.password_digest, username: @moderator.username } }, as: :json
    assert_response 200
  end

  test "should destroy moderator" do
    assert_difference('Moderator.count', -1) do
      delete moderator_url(@moderator), as: :json
    end

    assert_response 204
  end
end
