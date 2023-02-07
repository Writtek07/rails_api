require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url, as: :json
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { actual_question: @question.actual_question, answer: @question.answer, category: @question.category, difficulty_level: @question.difficulty_level, submitted_at: @question.submitted_at } }, as: :json
    end

    assert_response 201
  end

  test "should show question" do
    get question_url(@question), as: :json
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { actual_question: @question.actual_question, answer: @question.answer, category: @question.category, difficulty_level: @question.difficulty_level, submitted_at: @question.submitted_at } }, as: :json
    assert_response 200
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question), as: :json
    end

    assert_response 204
  end

  describe QuestionsController do
    let(:question) { create(:question) }

    describe 'PUT #update' do
      context 'when user is a moderator' do
        let(:moderator) { create(:moderator) }

        before do
          request.headers.merge!(moderator.create_new_auth_token)
        end

        it 'updates the question' do
          put :update, params: { id: question.id, question: { category: 'GEOGRAPHY', difficulty_level: 'HARD' } }
          question.reload

          expect(response).to have_http_status(:ok)
          expect(question.category).to eq('GEOGRAPHY')
          expect(question.difficulty_level).to eq('HARD')
        end
      end

      context 'when user is not a moderator' do
        it 'returns unauthorized error' do
          put :update, params: { id: question.id, question: { category: 'GEOGRAPHY', difficulty_level: 'HARD' } }

          expect(response).to have_http_status(:unauthorized)
          expect(json_response['error']).to eq('Not Authorized')
        end
      end
    end
  end
end
