class StudentsController < ApplicationController
  respond_to :json
  def create
    @student = Student.find_or_create_by_email(params[:student][:email])
    respond_with @student
  end
end
