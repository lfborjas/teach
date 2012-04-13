require 'test_helper'

class ExercisesApiTest < ActionDispatch::IntegrationTest
  test "that an exercise can be posted and then updated" do
    student = Student.create(account_number: '10611066')

    post "/students/#{student.to_param}/exercises", :format => :json,
         exercise: {name: "ex1.rb", contents: "hola mundo"}

    assert_equal 1, student.exercises.count
    assert_equal 'ex1.rb', student.exercises.first.name
    assert_equal 'hola mundo', student.exercises.first.contents

    post "/students/#{student.to_param}/exercises", :format => :json,
         exercise: {name: "ex1.rb", contents: "goodbye world"}

    assert_equal 1, student.exercises.count
    assert_equal 'ex1.rb', student.exercises.first.name
    assert_equal 'goodbye world', student.exercises.first.contents
  end
end
