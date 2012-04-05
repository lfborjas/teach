require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  test "that a student can be created" do
    post :create, format: :json, student: {email: "student@school.com"}
    assert_response :created
    puts @response.body
    assert_not_nil @response.body
  end
end
